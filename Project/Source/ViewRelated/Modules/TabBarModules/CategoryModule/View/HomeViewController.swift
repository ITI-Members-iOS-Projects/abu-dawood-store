//
//  HomeViewController.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/23/24.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet private weak var offerCollectionView: UICollectionView!
    
    let pageControl = CustomPageControl.init(frame: .zero)
    var timer: Timer?
    
    private var currentCellIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        headerView.configure()
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
}

// MARK: - Setup UI
extension HomeViewController {
    private func setupUI() {
        registerCells()
        setupTableViewDelegates()
        setupPageControl()
        starttimer()
    }
    
    private func registerCells() {
        offerCollectionView.register(cellType: OffersCollectionViewCell.self)
    }
    
    private func setupTableViewDelegates() {
        offerCollectionView.delegate = self
        offerCollectionView.dataSource = self
    }
    private func setupPageControl() {
        pageControl.currentPageIndicatorTintColor = R.color.gradient.callAsFunction()
        pageControl.pageIndicatorTintColor = R.color.secondaryButtonColor.callAsFunction()
        //        pageControl.numberOfPages = viewModel.numberOfItems()
        pageControl.numberOfPages = 3
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        self.view.addConstraints([
            
            pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: offerCollectionView.bottomAnchor, constant: 16),
            pageControl.heightAnchor.constraint(equalToConstant: 25),
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
    }
}

// MARK: - CollectionView Protocols
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: Dimensions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // MARK: Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OffersCollectionViewCell
        //        cell.configure(image: viewModel.itemAtSectionIndex(indexPath: indexPath))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
//        self.currentCellIndex = indexPath.item
    }
    
}

//extension HomeViewController {
//    func starttimer(){
//
//        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movetoindex), userInfo: nil, repeats: true)
//
//
//    }
//    @objc private func movetoindex () {
//        if currentCellIndex < viewModel.numberOfItems() - 1 {
//            currentCellIndex += 1
//        } else {
//            viewModel.showAuth()
//        }
//
//        onboardingCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
//        pageControl.currentPage = currentCellIndex
//    }
//
//}

extension HomeViewController {
    func starttimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movetoindex), userInfo: nil, repeats: true)
    }
    
    @objc
    func movetoindex() {
        if currentCellIndex < 2 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        
        offerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    
}
