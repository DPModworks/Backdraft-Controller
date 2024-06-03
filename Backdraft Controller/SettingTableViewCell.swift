//
//  SettingTableViewCell.swift
//  Backdraft Controller
//
//  Created by Ben Pauza on 5/29/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        return view
        
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
  
        contentView.backgroundColor = .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)

        
        
        
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        //accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: size, height: size)
        iconImageView.center = iconContainer.center
       
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
            height: contentView.frame.size.height)
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }
    public func configure(with model: SettingsOption){
        label.text = model.title
        label.textColor = .white
 
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        
        
    }
}
