//
//  UIControl+EX.swift
//  StationaryClient
//
//  Created by Eslam Mohamed on 09/04/2024.
//

import Foundation
import UIKit


extension UIView {
    
    func publisher<G>(for gestureRecognizer: G) -> UIGestureRecognizer.Publisher<G> where G: UIGestureRecognizer {
        UIGestureRecognizer.Publisher(gestureRecognizer: gestureRecognizer, view: self)
    }
}

extension UIGestureRecognizer {
    
    struct Publisher<G>: Combine.Publisher where G: UIGestureRecognizer {
        
        typealias Output = G
        typealias Failure = Never
        
        let gestureRecognizer: G
        let view: UIView
        
        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            subscriber.receive(
                subscription: Subscription(subscriber: subscriber, gestureRecognizer: gestureRecognizer, on: view)
            )
        }
    }
    
    class Subscription<G: UIGestureRecognizer, S: Subscriber>: Combine.Subscription where S.Input == G, S.Failure == Never {
        
        var subscriber: S?
        let gestureRecognizer: G
        let view: UIView
        
        init(subscriber: S, gestureRecognizer: G, on view: UIView) {
            self.subscriber = subscriber
            self.gestureRecognizer = gestureRecognizer
            self.view = view
            gestureRecognizer.addTarget(self, action: #selector(handle))
            view.addGestureRecognizer(gestureRecognizer)
        }
        
        @objc private func handle(_ gesture: UIGestureRecognizer) {
            _ = subscriber?.receive(gestureRecognizer)
        }
        
        func cancel() {
            view.removeGestureRecognizer(gestureRecognizer)
        }
        
        func request(_ demand: Subscribers.Demand) { }
    }
}
