//
//  FilmsTableViewController.swift
//  GET Films
//  MVC in iOS
//  Created by Safa Falaqi on 21/12/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {

    var filmsList: [FilmsResult]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        loadData()
        tableView.dataSource = self
        
    }
    
    func loadData(){
  
        // create a "data task" to make the request and run completion handler
        FilmsModel.getAllFilms( completionHandler: {
                    // see: Swift closure expression syntax
                    data, response, error in
                    // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
                    // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
                    do {
                        //optional unwraping
                        guard let myData = data else {return}
                        
                        let decoder = JSONDecoder()
                        
                        let jesonResult = try decoder.decode(Films.self, from: myData)
                        
                        self.filmsList? = jesonResult.results
                        
                        DispatchQueue.main.async {
                         self.tableView.reloadData()
                        }
                        
                    } catch {
                        print(error)
                    }
                })
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCell",for : indexPath)
        cell.textLabel?.text = filmsList?[indexPath.row].title ?? "No data"
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList?.count ?? 0
    }
}

