//
//  Onboarding.swift
//  Abu Dawood
//
//  Created by Fady Sameh on 6/13/24.
//

import UIKit

class Onboarding: BaseViewController<OnboardingViewModel> {
    
    @IBOutlet private weak var onboardingCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
        
    private var currentCellIndex: Int = 0 {
        didSet {
            pageControl.currentPage = currentCellIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: any additional setup after loading the view.
        setupUI()
    }
    
    private func getCurrentIndex() {
        
    }
    
    @IBAction private func nextButtonOnPressed(_ sender: GradientButton) {
        movetoindex()
    }
    
    @IBAction private func skipButtonnOnPressed(_ sender: CairoButtonRegular) {
    }
    
}

// MARK: - Setup UI
extension Onboarding {
    private func setupUI() {
        registerCells()
        setupTableViewDelegates()
                
        pageControl.numberOfPages = viewModel.numberOfItems()
    }
    
    private func registerCells() {
        onboardingCollectionView.register(cellType: OnboardingCollectionViewCell.self)
    }
    
    private func setupTableViewDelegates() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
    }
}

// MARK: - CollectionView Protocols
extension Onboarding: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
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
        let cell = collectionView.dequeueReusableCell(for: indexPath) as OnboardingCollectionViewCell
        cell.configure(image: viewModel.itemAtSectionIndex(indexPath: indexPath))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension Onboarding {
    private func movetoindex () {
        if currentCellIndex < viewModel.numberOfItems() - 1 {
            currentCellIndex += 1
        } else {
//            currentCellIndex = 0
            viewModel.showAuth()
        }
    
        onboardingCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
            
}
