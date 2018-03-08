import Foundation
import CoreData

public class Item: NSManagedObject {
    
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
}
