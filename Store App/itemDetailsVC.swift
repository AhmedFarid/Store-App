import UIKit
import CoreData
class itemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var titleTextFiled: CustomTextField!
    @IBOutlet weak var priceTextFild: CustomTextField!
    @IBOutlet weak var DetailsTextFiled: CustomTextField!
    @IBOutlet weak var storePicker: UIPickerView!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        //        let store = Store(context: context)
        //        store.name = "Best Buy"
        //        let store2 = Store(context: context)
        //        store2.name = "Tesla Dealership"
        //        let store3 = Store(context: context)
        //        store3.name = "Frys Electronics"
        //        let store4 = Store(context: context)
        //        store4.name = "Target"
        //        let store5 = Store(context: context)
        //        store5.name = "Amazon"
        //        let store6 = Store(context: context)
        //        store6.name = "K Mart"
        //
        //        ad.saveContext()
        getStores()
        
        
        if itemToEdit != nil {
            loadItemDate()
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when seelcted
    }
    
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        } catch {
            
            // handle the error
        }
    }
    
    @IBAction func saveButt(_ sender: UIButton) {
        
        
        var item: Item!
        
        if itemToEdit == nil {
            item = Item(context: context)
        }else{
            item = itemToEdit
            
        }
        
        
        
        if let title = titleTextFiled.text {
            item.title = title
        }
        
        if let price = priceTextFild.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let details = DetailsTextFiled.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    func loadItemDate() {
        if let item = itemToEdit {
            titleTextFiled.text = item.title
            priceTextFild.text = "\(item.price)"
            DetailsTextFiled.text = item.details
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    
                    let s = stores[index]
                    if s.name == store.name {
                        
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                    
                } while (index < stores.count)
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
