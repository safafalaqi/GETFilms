//
//  PeopleDetailsViewController.swift
//  GET Films
//
//  Created by Safa Falaqi on 23/12/2021.
//

import UIKit

class PeopleDetailsViewController: UIViewController {

    var person:Result?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    var species:Species?
    override func viewDidLoad() {
        super.viewDidLoad()
            
        nameLabel.text = person?.name
        birthYearLabel.text = "\(String(describing: person!.birthYear))"
        massLabel.text = "\(String(describing: person!.mass))"
        genderLabel.text = "\(String(describing: person!.gender.rawValue))"
        
        if let url = person?.species{
            if !url.isEmpty{
        SpeciesModel.getSpecies(url: url[0]) {
            data, response, error in
            
            do {
                //optional unwraping
                guard let myData = data else {return}
                
                let decoder = JSONDecoder()
                
                let jesonResult = try decoder.decode(Species.self, from: myData)
                
                DispatchQueue.main.async {
                    self.speciesLabel.text = jesonResult.name
                }
                
              
            }catch{
                print("\(error)")
            }
            
           }
                
            }else{
                speciesLabel.text = "unknown"
            }
         }
  
    }
}
