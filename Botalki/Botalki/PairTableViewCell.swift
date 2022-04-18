import Foundation
import UIKit
import PinLayout
//import Kingfisher


final class PairTableViewCell: UITableViewCell {
    private let timeLabel = UILabel()
    private let houseLabel = UILabel()

    private let imageViewClock = UIImageView(image: UIImage(named: "clock.png"))
    private let imageViewDor = UIImageView(image: UIImage(named: "dor.png"))
    private let imageViewDor2 = UIImageView(image: UIImage(named: "dor.png"))
//    private let timeLabel = UILabel()
    
//    private let images: [String] = ["personalhotspot", "person", "asterisk"]
    
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.alpha = 0
        self.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
                UIView.animate(withDuration: 1) {
                    self.alpha = 1
                    self.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
                }
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        containerView.addSubview(imageViewClock)
        containerView.bringSubviewToFront(imageViewClock)
        
        containerView.addSubview(imageViewDor)
        containerView.bringSubviewToFront(imageViewDor)
        
        containerView.addSubview(imageViewDor2)
        containerView.bringSubviewToFront(imageViewDor2)
//
//        let imageDor = UIImage(named: "dor.png")
//        let imageViewDor = UIImageView(image: imageDor!)
//        imageViewDor.frame = CGRect(x: 70, y: 20, width: 20, height: 20)
//        containerView.addSubview(imageViewDor)
//        containerView.bringSubviewToFront(imageViewDor)
        
        selectionStyle = .none
        
        timeLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        timeLabel.textColor = .black
        timeLabel.numberOfLines = 2
        timeLabel.textAlignment = .right
        
        houseLabel.font = .systemFont(ofSize: 17, weight: .bold)
        houseLabel.textColor = .black
        houseLabel.numberOfLines = 2
        houseLabel.textAlignment = .left
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 0.5
        containerView.layer.shadowOffset = .init(width: 0.5, height: 0.5)
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = UIColor(rgb: 0xC4C4C4)
        
        
        [timeLabel, houseLabel].forEach {
            containerView.addSubview($0)
        }
        
        contentView.addSubview(containerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.pin
            .horizontally(15)
            .vertically(6)
        
        
        timeLabel.pin
            .vCenter()
//            .bottom(8)
            .left(60)
            .height(60)
            .width(60)
            .sizeToFit(.height)
        
        houseLabel.pin
            .vCenter()
//            .bottom(8)
            .right(30)
            .height(60)
            .width(60)
            .sizeToFit(.height)
        
        imageViewClock.pin
            .vCenter()
            .left(20)
            .height(27)
            .width(27)
//            .sizeToFit(.height)
        
        imageViewDor.pin
            .top(11)
            .left(120)
            .height(25)
            .width(25)
        
        imageViewDor2.pin
            .top(46)
            .left(120)
            .height(25)
            .width(25)
    }
    
    func config(with indexCell: Int) {
        let studyTimes = ["8:30\n10:05", "10:15\n11:50", "12:00\n13:35",
                          "13:50\n15:25", "15:40\n17:15", "17:25\n19:00",
                          "19:10\n20:45"]
        
        let timee: String
        if indexCell > 6 {
            timee = "Мухосранск"
        }
        else {
            timee = studyTimes[indexCell]
        }
        
        houseLabel.text = "ГЗ\nУЛК"
        timeLabel.text = timee

    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
