//
//  OnBoardingCollectionViewCell.swift
//  VerityUp
//
//  Created by Rivaldo Fernandes on 10/04/22.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnBoardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
