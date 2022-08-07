//
//  ImageDetailViewController.swift
//  ImagesAlexTask
//
//  Created by Alex on 06.08.22.
//

import UIKit

class ImageDetailViewController: UIViewController {

    let detailImage = UIImageView()
    let imageSize = UILabel()
    let imageType = UILabel()
    let imageTag = UILabel()
    let imageAuthorName = UILabel()
    let imageAuthorImage = UIImageView()
    let imageViewCount = UILabel()
    let imageLike = UILabel()
    let imageComents = UILabel()
    let favCount = UILabel()
    let downloandCount = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView()
        configImageView()
        setStackViewTitle()
        SetUpStackViewImageInfo()
        SetUpStackViewImageProperties()
        configureLabel()
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = false
        
    }
    func detailImageView() {
            self.detailImage.layer.masksToBounds = true
            detailImage.layer.cornerRadius = 20
            detailImage.contentMode = .scaleAspectFill
            detailImage.frame =  CGRect(x: 75, y: 90, width: 250, height: 250)
            view.addSubview(detailImage)
        }

    
    func configImageView() -> Void {
        
        imageAuthorImage.translatesAutoresizingMaskIntoConstraints = false
        imageAuthorImage.adjustsImageSizeForAccessibilityContentSizeCategory = true
        imageAuthorImage.translatesAutoresizingMaskIntoConstraints = false
        imageAuthorImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageAuthorImage.layer.cornerRadius = 20
        imageAuthorImage.clipsToBounds = true
      }
   
    func configure(viewModelGetObject: ViewModelGetObject?) {
        
        imageAuthorName.text = " სახელი:  \(viewModelGetObject?.loadImageInfo() ?? "")"
        imageSize.text = " სურათის ზომა:  \(viewModelGetObject?.loadImageSize() ?? 0)"
        imageType.text = " სურათის ტიპი:  \(viewModelGetObject?.loadImageType() ?? "")"
        imageTag.text = " თაგი:  \(viewModelGetObject?.loadImageTag() ?? "")"
        imageViewCount.text = " ნახვების რაოდენობა:  \(viewModelGetObject?.loadImageViews() ?? 0)"
        imageLike.text = " მოწონება:  \(viewModelGetObject?.loadImageLikes() ?? 0)"
        imageComents.text = " კომენტარი:  \(viewModelGetObject?.loadImageComments() ?? 0)"
        favCount.text = " Favorites:  \(viewModelGetObject?.loadImageCollections() ?? 0)"
        downloandCount.text = " გადმოწრები:  \(viewModelGetObject?.loadImageDownloand() ?? 0)"
        
        
        viewModelGetObject?.loadDetailImage { (image) in
            DispatchQueue.main.async {
                self.detailImage.image = image
                
            }
        }
        viewModelGetObject?.loadUserImage { (image) in
            DispatchQueue.main.async {
                self.imageAuthorImage.image = image
                
            }
        }
    }

    func setStackViewTitle() -> Void {
        imageAuthorName.textColor = .white
        imageAuthorName.font = .systemFont(ofSize: 16, weight: .regular)
          
          let stackView = UIStackView(arrangedSubviews: [imageAuthorImage, imageAuthorName])
          stackView.distribution = .fill
          stackView.spacing = 10
          stackView.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(stackView)
          stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
          stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
          stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110).isActive = true
          stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

      }
    
    func SetUpStackViewImageInfo() -> Void {
        let stackViewInfo = UIStackView(arrangedSubviews: [imageLike,imageViewCount,imageComents,favCount,downloandCount])
        stackViewInfo.distribution = .fill
        stackViewInfo.spacing = 10
        stackViewInfo.axis = .vertical
        stackViewInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewInfo)
        stackViewInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackViewInfo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackViewInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250).isActive = true
        stackViewInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func SetUpStackViewImageProperties() -> Void {
        let stackViewProperties = UIStackView(arrangedSubviews: [imageSize,imageType,imageTag])
        stackViewProperties.distribution = .fill
        stackViewProperties.spacing = 10
        stackViewProperties.axis = .vertical
        stackViewProperties.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewProperties)
        stackViewProperties.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackViewProperties.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackViewProperties.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackViewProperties.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewProperties.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func configureLabel(){
        imageAuthorName.textColor = .orange
        imageSize.textColor = .blue
        imageType.textColor = .white
        imageTag.textColor = .blue
        imageViewCount.textColor = .white
        imageLike.textColor = .blue
        imageComents.textColor = .blue
        favCount.textColor = .white
        downloandCount.textColor = .blue
    }
    
}
