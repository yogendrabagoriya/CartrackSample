//
//  CTLoginDBRepository.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import Foundation
import UIKit
import CoreData

class CTLoginDBRepository: LoginDBRepository{
    
    /**
        This function willl verify credentials and return if record exists.
     */
    func verifyCredentials(credentials: Dictionary<String, String>) -> (Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        let name = credentials["name"] ?? ""
        let namePredicate = NSPredicate(format: "name = %@", name)
        
        let password = credentials["password"] ?? ""
        let passwordPredicate = NSPredicate(format: "password = %@", password)
        
        let county = credentials["country"] ?? ""
        let countryPredicate = NSPredicate(format: "country = %@", county)
        
        fetchRequest.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                namePredicate,
                passwordPredicate,
                countryPredicate
            ]
        )
        
        do{
            let objects = try managedObjectContext.fetch(fetchRequest)
            if objects.count > 0{
                return true
            }else{
                return false
            }
        }catch{
            return false
        }
    }
    
    /**
        This Will user record only if it's not present into DB
     */
    func saveRecordIfEmpty(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = User.fetchRequest()
        fetchRequest.fetchLimit = 1

        do{
            let object = try managedObjectContext.fetch(fetchRequest).first
            
            if object == nil{
                let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext)!
                
                let userObj = NSManagedObject(entity: userEntity, insertInto: managedObjectContext)
                
                userObj.setValue("Yogendra", forKey: "name")
                userObj.setValue("India", forKey: "country")
                userObj.setValue("yogi", forKey: "password")
                
                try managedObjectContext.save()
            }
        }catch{
            print("Could Not Save")
        }
    }
}
