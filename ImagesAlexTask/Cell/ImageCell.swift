//
//  ImageCell.swift
//  ImagesAlexTask
//
//  Created by Alex on 05.08.22.
//

import UIKit

class ImageCell : UITableViewCell {
    
     static let identifier = "ImageCell"
    
    private lazy var containerView: UIView = {
           let container = UIView()
           container.backgroundColor = .black
           container.layer.masksToBounds = true
           container.layer.cornerRadius = 20
           container.translatesAutoresizingMaskIntoConstraints = false
           return container
       }()
    
    
    private lazy var blur: UIVisualEffectView = {
            let blurEffect = UIBlurEffect(style: .dark)
            let blur = UIVisualEffectView(effect: blurEffect)
            blur.translatesAutoresizingMaskIntoConstraints = false
            return blur
        }()
    
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor =  .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    
    let pixImage:UIImageView = {
             let img = UIImageView()
             img.contentMode = .scaleAspectFill 
             img.translatesAutoresizingMaskIntoConstraints = false
             img.frame.size = CGSize(width: 50, height: 50)
             img.layer.cornerRadius = 15
             img.clipsToBounds = true
            return img
         }()
    

    func configure(viewModelGetObject: ViewModelGetObject?) {
        self.nameLabel.text = viewModelGetObject?.loadImageInfo()
        viewModelGetObject?.loadPreviewImage { (image) in
            DispatchQueue.main.async {
                self.pixImage.image = image
            }
        }
    }
  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        backgroundColor = .black
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstraints() {
        
                contentView.addSubview(containerView)
                containerView.addSubview(blur)
                containerView.addSubview(pixImage)
                containerView.addSubview(nameLabel)
       
        
        
           NSLayoutConstraint.activate([
               containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
               containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
               containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
               containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           
               pixImage.topAnchor.constraint(equalTo: containerView.topAnchor),
               pixImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
               pixImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
               pixImage.widthAnchor.constraint(equalToConstant: 70),
               
               nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
               nameLabel.leadingAnchor.constraint(equalTo: pixImage.trailingAnchor, constant: 50),
               nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
               
               blur.topAnchor.constraint(equalTo: containerView.topAnchor),
               blur.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
               blur.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
               blur.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
               
              
           ])
       }
    
   
        

    
}

