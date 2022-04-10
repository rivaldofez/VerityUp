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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
            OnBoardingSlide(title: "Rivaldo 1", description: "Ini desc 1", image: UIImage(named: "aang.jpg")!),
            OnBoardingSlide(title: "Rivaldo 2", description: "Ini desc 2", image: UIImage(named: "aang.jpg")!)
        
        ]
    }
    
    
    @IBAction func btnNextClicked(_ sender: UIButton) {
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
    
}
