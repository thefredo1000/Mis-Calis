//
//  SecondViewController.swift
//  Mis Calis
//
//  Created by Rodrigo Casale on 11/17/17.
//  Copyright © 2017 Rodrigo Casale. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var challenges = RetosNow.init().aChallenges
    var isTrue = RetosNow.init().aIsTrue
    
    var materias = MateriasAndCalisNow.init().materias
    var calisNow = MateriasAndCalisNow.init().calisNow
    
    
    @IBOutlet weak var challengeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        challengeTableView.dataSource = self
        challengeTableView.delegate = self
        challengeTableView.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = challenges[indexPath.row]
        cell.textLabel?.textColor = UIColor(red:0.19, green:0.20, blue:0.22, alpha:1.0)
        cell.textLabel?.textAlignment = NSTextAlignment(rawValue: 2)!
        cell.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        cell.imageView?.image = UIImage(named: "m\(isTrue[indexPath.row])")
        
        return cell
    }
        
    @IBAction func newChallengeButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "challengeSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let subVC = segue.destination as! SubjectViewController
        subVC.bothInfo = sender as! Array
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //performSegue(withIdentifier: "subjectSegue", sender: Any?.self)
        
        let subject = materias[indexPath.row]
        let grades = calisNow[indexPath.row]
        
        //el primero viene el nombre de la materia que se escojio, el segundo es la calificacion de la materia
        let bothInfo = [subject, String(grades)]
        
        performSegue(withIdentifier: "secondSubjectSegue", sender: bothInfo)
        //performSegue(withIdentifier: "subjectSegue", sender: grades)
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
