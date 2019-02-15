//
//  FirstViewController.swift
//  Mis Calis
//
//  Created by Rodrigo Casale on 11/17/17.
//  Copyright © 2017 Rodrigo Casale. All rights reserved.
//

import UIKit


//var materias = ["Matematicas", "Español", "Ingles", "Fisica", "Computacion", "Educacion", "Arte"]
//var calisNow = [81, 88, 88, 78, 91, 80, 99]

var calisNow = [81, 88, 88, 78, 40, 69, 99]



class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var calisLabelBottomBorder: UIView!
    @IBOutlet weak var calisLabel: UILabel!
    @IBOutlet weak var calisTableView: UITableView!
    
    var materias = MateriasAndCalisNow.init().materias
    var calisNow = MateriasAndCalisNow.init().calisNow
    var numbersCalisNow = MateriasAndCalisNow.init().calisNow

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calisTableView.dataSource = self
        calisTableView.delegate = self
        print(String(calisNow[0]))
        calisTableView.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0);
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return materias.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = materias[indexPath.row]
        cell.textLabel?.font = UIFont (name: "PingFangHK-Semibold", size: 20)
        cell.textLabel?.textColor = UIColor(red:0.19, green:0.20, blue:0.22, alpha:1.0)
        cell.textLabel?.textAlignment = NSTextAlignment(rawValue: 2)!
        cell.detailTextLabel?.textAlignment = NSTextAlignment(rawValue: 0)!
        cell.imageView?.image = UIImage(named: "number_\(String(numbersCalisNow[indexPath.row]))")
        cell.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        cell.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //performSegue(withIdentifier: "subjectSegue", sender: Any?.self)
        
        let subject = materias[indexPath.row]
        let grades = calisNow[indexPath.row]
        
        //el primero viene el nombre de la materia que se escojio, el segundo es la calificacion de la materia
        let bothInfo = [subject, String(grades)]
        
        performSegue(withIdentifier: "subjectSegue", sender: bothInfo)p
        //performSegue(withIdentifier: "subjectSegue", sender: grades)
        print(calisNow[indexPath.row])
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let subVC = segue.destination as! SubjectViewController
        subVC.bothInfo = sender as! Array
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

