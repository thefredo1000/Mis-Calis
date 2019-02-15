//
//  SubjectViewController.swift
//  Mis Calis
//
//  Created by Rodrigo Casale on 12/3/17.
//  Copyright © 2017 Rodrigo Casale. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController {
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subjectStatusLabel: UILabel!
    
    var subject = "MATERIA"
    var grades = 100
    var bothInfo = ["MATERIA", "100"]
    
    var homeworks = ["Tarea Derivadas 1", "Tarea Derivadas 2", "Tarea Derivadas 3", "Examen Pre-Parcial 1", "Tarea Integrales 1", "Tarea Integrales 2", "Tarea investigacion Newton", "Examen Parcial 1" ]
    var homeworksGrades = [80, 70, 75, 70, 70, 80, 100, 95]

    var minimumGrade = MateriasAndCalisNow.init().minimumGrade
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectLabel.text = bothInfo[0]
        gradeLabel.text = bothInfo[1]
        grades = Int(bothInfo[1])!
        
        
        if grades >= Int(minimumGrade) {
            
            subjectStatusLabel.text = "PASADA"
            subjectStatusLabel.textColor = UIColor(red:0.00, green:0.74, blue:0.14, alpha:1.0)
            
        } else {
            
            subjectStatusLabel.text = "REPROBADA"
            subjectStatusLabel.textColor = UIColor(red:0.73, green:0.22, blue:0.00, alpha:1.0)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindSubjectSegue", sender: self)
        
    }
    
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent    //para tener la status bar blanca
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworksGrades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = homeworks[indexPath.row]
        
        return cell
    }
    
    
}
