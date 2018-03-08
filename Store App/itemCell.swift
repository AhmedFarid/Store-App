import UIKit

class itemCell: UITableViewCell {
    
    
    @IBOutlet weak var prodectImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    func configureCell(item: Item){
        
        titleLable.text = item.title
        price.text = "$\(item.price)"
        details.text = item.details
        prodectImage.image = item.toImage?.image as? UIImage
    }
    
}
