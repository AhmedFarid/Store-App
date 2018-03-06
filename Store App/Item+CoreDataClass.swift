import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        
        super.awakeFromInsert()
        
        self.created = NSDate()
        
    }

}
