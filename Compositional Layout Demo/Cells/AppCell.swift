//
//  Created by Mustafa Yusuf on 15/01/22.
//

import UIKit.UICollectionViewCell

final class AppCell: UICollectionViewCell, ReusableView {
    
    static var defaultReuseIdentifier: String = String(describing: AppCell.self)
    
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
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 2
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(primaryStackView)
        NSLayoutConstraint.activate([
            appIconImageView.widthAnchor.constraint(equalTo: appIconImageView.heightAnchor),
            
            installButton.heightAnchor.constraint(equalToConstant: Constant.installButtonHeight),
            
            primaryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            primaryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            primaryStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            primaryStackView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
}
