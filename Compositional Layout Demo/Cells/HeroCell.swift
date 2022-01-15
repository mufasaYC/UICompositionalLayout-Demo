//
//  Created by Mustafa Yusuf on 15/01/22.
//

import UIKit.UICollectionViewCell

final class HeroCell: UICollectionViewCell, ReusableView {
    
    static var defaultReuseIdentifier: String = String(describing: HeroCell.self)
    
    private lazy var appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .randomColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerCurve = .continuous
        imageView.layer.cornerRadius = Constant.cornerRadius
        return imageView
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var appSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a slightly long subtitle for my app"
        label.font = .preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var installButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET", for: .normal)
        button.tintColor = .white
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = Constant.installButtonHeight/2
        button.backgroundColor = .separator
        button.widthAnchor.constraint(equalToConstant: Constant.installButtonWidth).isActive = true
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1).withWeight(.bold)
        return button
    }()
    
    private lazy var primaryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appIconImageView, descriptionStackView, installButton])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = Constant.interItem
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var descriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appNameLabel, appSubtitleLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Constant.intraItem
        return stackView
    }()
    
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.randomColor.withAlphaComponent(0.6)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerCurve = .continuous
        imageView.layer.cornerRadius = Constant.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(heroImageView)
        addSubview(primaryStackView)
        
        NSLayoutConstraint.activate([
            appIconImageView.widthAnchor.constraint(equalToConstant: 50),
            appIconImageView.heightAnchor.constraint(equalTo: appIconImageView.widthAnchor),
            
            installButton.heightAnchor.constraint(equalToConstant: Constant.installButtonHeight),
            
            heroImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            heroImageView.topAnchor.constraint(equalTo: topAnchor),
            
            primaryStackView.bottomAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: -Constant.interItem),
            primaryStackView.leadingAnchor.constraint(equalTo: heroImageView.leadingAnchor, constant: Constant.interItem),
            primaryStackView.trailingAnchor.constraint(equalTo: heroImageView.trailingAnchor, constant: -Constant.interItem)
        ])
    }
}

