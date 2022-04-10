//
//  OnboardingViewController.swift
//  VerityUp
//
//  Created by Rivaldo Fernandes on 10/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides : [OnBoardingSlide] = []
    
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
            OnBoardingSlide(title: "Rivaldo 1", description: "Ini desc 1", image: UIImage(named: "aang.jpg")!),
            OnBoardingSlide(title: "Rivaldo 2", description: "Ini desc 2", image: UIImage(named: "aang.jpg")!),
            OnBoardingSlide(title: "Rivaldo 3", description: "Ini desc 2", image: UIImage(named: "aang.jpg")!)
        
        ]
    }
    
    
    @IBAction func btnNextClicked(_ sender: UIButton) {
        if(currentPage == slides.count-1){
            print("Go to next page")
        }else{
            currentPage += 1
        }
        
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
        pageControl.currentPage = currentPage
        
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        
        pageControl.currentPage = currentPage
        
        if currentPage == slides.count-1 {
            btnNext.setTitle("Get Started", for: .normal)
        }else{
            btnNext.setTitle("Next", for: .normal)
        }
    }
    
}
