//
//  ViewController.swift
//  RaphaelSignIn
//
//  Created by Suzie Su Jin Ahn on 2/17/18.
//  Copyright © 2018 Raphael Wellness Center. All rights reserved.
//
import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var ref: DatabaseReference!
    
    let payment_type = ["Insurance", "Motor Vehicle Accident", "Cash"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
   
    @IBAction func Submit(_ sender: UIButton) {
        let new_patient = getPatientInfo()
        sendToFirebase(patient: new_patient)
    }
    
    @IBOutlet var Name: UITextField!
    
    @IBOutlet var Birthday: UITextField!

    @IBOutlet var Gender: [UIButton]!
    
    @IBOutlet var Address: UITextField!
    
    @IBOutlet var City: UITextField!
    
    @IBOutlet var State: UITextField!
    
    @IBOutlet var Phone: UITextField!
    
    @IBOutlet var Payment: UIPickerView!
    
    
    
    
    
    @IBAction func selectGender(_ sender: UIButton){
        let gender = Gender.index(of: sender)
        setGender(index: gender!)
    }
    
    var gender: String?
    
    func setGender(index: Int){
    
        if(index == 0){
            gender = "Female"
        }
        else{
            gender = "Male"
        }
    
    }
    
    
    func getPatientInfo()->patientInfo{
        var pi = patientInfo()
        pi.name = Name.text
        pi.birthday = Birthday.text
        pi.gender = gender
        pi.address = Address.text
        pi.city = City.text
        pi.state = State.text
        pi.phone = Phone.text
        
        return pi
        
    }
    
    func contactAddress(address: String?, city: String?, state: String?)->String?{
        var to_return: String?
        to_return = address!+" " + city!+" " + state!
        return to_return
    }
    
    func sendToFirebase(patient: patientInfo){
        ref = Database.database().reference()
        var address: String?
        address = contactAddress(address: patient.address, city: patient.city, state: patient.state)
        
        let patient_ref = self.ref!.child("patients").childByAutoId()
        let patient_id = patient_ref.key
        self.ref.child("patients").child(patient_id).child("name").setValue(patient.name)
        self.ref.child("patients").child(patient_id).child("gender").setValue(patient.gender)
        self.ref.child("patients").child(patient_id).child("dob").setValue(patient.birthday)
        self.ref.child("patients").child(patient_id).child("address").setValue(address)
        self.ref.child("patients").child(patient_id).child("phone_number").setValue(patient.phone)
    
    }
    
    
    override func viewDidLoad() {
        ref = Database.database().reference()
        
        ref.child("Patient").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            print("here:")
            
            
            let name = value?["Address"] as? String ?? ""
            print(name)
            //let username = value?["username"] as? String ?? ""
            //let user = User(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
   
    
    

}

