//
//  MovieQuotesTableViewController.swift
//  MovieQuotes
//
//  Created by Yuan zhou on 3/29/18.
//  Copyright © 2018 Yuan zhou. All rights reserved.
//

import UIKit

class MovieQuotesTableViewController: UITableViewController {
    
    let movieQuoteCellIdentifier = "MovieQuoteCell"
    let noMoviwQuoteCell = "NoMoviwQuoteCell"
    let names = ["Olivia", "Fred", "Christy"]
    var movieQuotes = [MovieQuotes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(showAddDialog))
//        movieQuotes.append(MovieQuotes(quote:"i will be back", movie: "the terminator"))
//        movieQuotes.append(MovieQuotes(quote:"YO adrian!", movie: "not the terminator"))
    
    }
    
    @objc func showAddDialog(){
//        print("you pressed add")
        let alertController = UIAlertController(title: "create a new movie quote", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Quote"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "movie title"
        }
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler:nil)
        
        let createQuoteAction = UIAlertAction(title: "create quote", style: UIAlertActionStyle.default) { (action) in
            let quoteTextField = alertController.textFields![0]
            let movieTextField = alertController.textFields![1]
            print("quoteTextField = \(quoteTextField.text!)")
            print("movieTextField = \(movieTextField.text!)")
            let movieQuote = MovieQuotes(quote: quoteTextField.text!,
                                         movie: movieTextField.text!)
            self.movieQuotes.insert(movieQuote, at: 0)
            if self.movieQuotes.count == 1{
                self.tableView.reloadData()
            }else{
                self.tableView.insertRows(at: [IndexPath(row:0, section:0)], with: UITableViewRowAnimation.top)
            }            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(createQuoteAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return max(movieQuotes.count, 1)
        
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//     let cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
//     cell.textLabel?.text = movieQuotes[indexPath.row].quote
//     cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
//     return cell
        var cell: UITableViewCell
        if movieQuotes.count == 0{
            cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
        }else{
             cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
             cell.textLabel?.text = movieQuotes[indexPath.row].quote
             cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
        }
        return cell
     }
 
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
