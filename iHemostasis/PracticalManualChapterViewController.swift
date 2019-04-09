//
//  PracticalManualChapterViewController.swift
//  iHemostasis
//
//  Created by zoraj on 15/09/2016.
//  Copyright © 2016 com.stago. All rights reserved.
//

import UIKit

class PracticalManualChapterViewController: ParentViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var cells : Array <UIView>?
    @IBOutlet weak var abbreviationButton: UIButton?
    private let kPracticalManualChapterCellIdentifier = "kPracticalManualChapterCellIdentifier"
    var practicalManualChapters = [["title":"", "description":""]]
    var practicalManualType : Utils.PracticalManualType = Utils.PracticalManualType.AntiphospholipidSyndrome
    
    // Antiphospholyp syndrome
    var contextMenuPathophysiologyList = [
        ["title" : "Introduction", "filename" : "Orange"],
        ["title" : "Clinical manifestations", "filename" : "Orange - Clinical Manif"],
        ["title" : "Pathogenic mechanisms published in literature", "filename" : "Pathogenic"],
        ["title" : "The effect of antiphospholipid antibodies on cells", "filename" : "The effect 1"],
        ["title" : "The effect of antiphospholipid antibodies on coagulation", "filename" : "The effect 2"],
        ["title" : "The effect of antiphospholipid antibodies on the complement system", "filename" : "The effect 3"],
        ["title" : "Conclusion", "filename" : "Conclusion"],
        ["title" : "Take home messages", "filename" : "Take home messages"],
        ["title" : "References", "filename" : "References"]
    ]
    
    var contextMenuClinicalManifList = [
        ["title" : "Introduction", "filename" : "Blue"],
        ["title" : "Clinical manifestations", "filename" : "Clinical manifestations"],
        ["title" : "APS: isolated or associated with autoimmune (or other) disease", "filename" : "APS: isolated or associated with autoimmune (or other) disease", "figurename" : ""],
        ["title" : "Bleeding in APS", "filename" : "Bleeding in APS"],
        ["title" : "Classification criteria", "filename" : "Classification criteria"],
        ["title" : "Catastrophic antiphospholipid syndrome", "filename" : "Catastrophic antiphospholipid syndrome"],
        ["title" : "Take home messages", "filename" : "Take home messages"],
        ["title" : "References", "filename" : "References"],
        ]
    
    var contextMenuLaboratoryDiagnosisImmunoList = [
        ["title" : "Introduction", "filename" : "VioletImmu"],
        ["title" : "Microplate preparation"],
        ["title" : "Preanalytical variables"],
        ["title" : "Reference material"],
        ["title" : "Expression of results"],
        ["title" : "Cut-off determination"],
        ["title" : "Interpretation of results"],
        ["title" : "Take home messages"],
        ["title" : "References"],
        ]
    
    var contextMenuLaboratoryDiagnosisLupusList = [
        ["title" : "Introduction", "filename" : "VioletLupus"],
        ["title" : "Lupus anticoagulant testing"],
        ["title" : "Conclusion"],
        ["title" : "Take home messages"],
        ["title" : "References"],
        ]
    var contextMenuLaboratoryDiagnosisAppList = [
        ["title" : "Introduction", "filename" : "VioletApp"],
        ["title" : "Sample manipulation"],
        ["title" : "Preliminary coagulation screen"],
        ["title" : "Lupus anticoagulant assays"],
        ["title" : "Screening tests"],
        ["title" : "What should I do in my routine testing?"],
        ["title" : "Mixing tests"],
        ["title" : "Confirmatory tests"],
        ["title" : "Reference intervals and cut-offs"],
        ["title" : "Algorithms"],
        ["title" : "Integrated testing"],
        ["title" : "Testing anticoagulated patients"],
        ["title" : "Reporting"],
        ["title" : "Take home messages"],
        ["title" : "References"],
        ]
    
    var contextMenuManagementPatientsList = [
        ["title" : "Introduction", "filename" : "Brown", "figurename" : ""],
        ["title" : "Management of thrombosis", "filename" : "Brown - Management", "figurename" : "Table1"],
        ["title" : "Management of pregnancy in APS", "filename" : "Brown - Management 2", "figurename" : "Figure1"],
        ["title" : "Management of catastrophic antiphospholipid syndrome", "filename" : "Brown - Management 3", "figurename" : ""],
        ["title" : "Trends and future in APS management", "filename" : "Brown - Trends", "figurename" : ""],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    // Parenteral Anticoagulant
    var contextMenuUnfractionatedHeparinList = [
        ["title" : "Introduction", "filename" : "P-Orange", "figurename" : ""],
        ["title" : "Historical highlights", "filename" : "", "figurename" : ""],
        ["title" : "Production and chemistry of heparin", "filename" : "Pathogenic", "figurename" : ""],
        ["title" : "Mechanism of action", "filename" : "", "figurename" : ""],
        ["title" : "Pharmacology", "filename" : "", "figurename" : ""],
        ["title" : "Laboratory monitoring", "filename" : "", "figurename" : ""],
        ["title" : "Rationale for UFH dose and mode of administration", "filename" : "", "figurename" : ""],
        ["title" : "Clinical indications and UFH dosing", "filename" : "", "figurename" : "Table1"],
        ["title" : "Adverse events", "filename" : "", "figurename" : ""],
        ["title" : "Limitations of UFH", "filename" : "Limitations of UFH", "figurename" : ""],
        ["title" : "Advantages of UFH", "filename" : "Advantages of UFH", "figurename" : ""],
        ["title" : "Summary", "filename" : "Summary", "figurename" : ""],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        
        ]
    
    var contextMenuLowMolecularList = [
        ["title" : "The drug substances of LMWH", "filename" : "P-Blue", "figurename" : "Table1"],
        ["title" : "Pharmacology", "filename" : "P-Blue", "figurename" : "Figure2"],
        ["title" : "Clinical application", "filename" : "P-Blue", "figurename" : "Table4"],
        ["title" : "Diversity of LMWH", "filename" : "P-Blue", "figurename" : "Table8"],
        ["title" : "Limitations", "filename" : "P-Blue", "figurename" : ""],
        ["title" : "LMWHs in the haemostasis diagnosis", "filename" : "P-Blue", "figurename" : "Table1"],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    var contextMenuHeparinInducedList = [
        ["title" : "Introduction", "filename" : "P-Violet", "figurename" : ""],
        ["title" : "Pathophysiology of HIT", "filename" : "P-Violet", "figurename" : "Figure1"],
        ["title" : "Clinical manifestations", "filename" : "P-Violet", "figurename" : "Table1"],
        ["title" : "Laboratory diagnosis of HIT", "filename" : "P-Violet", "figurename" : ""],
        ["title" : "Evidence based Bayesian approach to diagnose HIT", "filename" : "P-Violet", "figurename" : "Figure2"],
        ["title" : "Management of HIT patients", "filename" : "P-Violet", "figurename" : ""],
        ["title" : "Take Home messages", "filename" : "P-Violet", "figurename" : ""],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    var contextMenuFondaparinux = [
        ["title" : "Origin", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Fondaparinux is a fully synthetic pentasaccharide", "filename" : "P-Brown", "figurename" : "Figure1"],
        ["title" : "Mechanism of action", "filename" : "P-Brown", "figurename" : "Table2"],
        ["title" : "Pharmacological properties", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Pharmacokinetics", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Clinical trials", "filename" : "P-Brown", "figurename" : "Table3"],
        ["title" : "Indications and contraindications", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Adverse effects", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Fondaparinux, thrombocytopenia and heparin-induced thrombocytopenia (HIT)", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Reversal of anticoagulant activity", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "Impact on coagulation tests", "filename" : "P-Brown", "figurename" : "Table4"],
        ["title" : "Monitoring the clinical use of fondaparinux", "filename" : "P-Brown", "figurename" : ""],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    var contextMenuDenaparoid = [
        ["title" : "Introduction", "filename" : "P-Red", "figurename" : ""],
        ["title" : "Pharmacology", "filename" : "P-Red", "figurename" : "Figure1"],
        ["title" : "Indications (including dosing) and contraindications", "filename" : "P-Red", "figurename" : "Table1"],
        ["title" : "Limitations", "filename" : "P-Red", "figurename" : ""],
        ["title" : "Reversal", "filename" : "P-Red", "figurename" : ""],
        ["title" : "Impact on coagulation assays", "filename" : "P-Red", "figurename" : ""],
        ["title" : "Laboratory monitoring", "filename" : "P-Red", "figurename" : ""],
        ["title" : "Who, When, How, Why", "filename" : "P-Red", "figurename" : "Table2"],
        ["title" : "Expected anti-Xa activity", "filename" : "P-Red", "figurename" : "Figure2"],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    var contextMenuDirectThrombin = [
        ["title" : "Introduction", "filename" : "P-Blue-Darker", "figurename" : ""],
        ["title" : "Classification", "filename" : "P-Blue-Darker", "figurename" : "Figure1"],
        ["title" : "Methods for monitoring direct thrombin inhibitors", "filename" : "P-Blue-Darker", "figurename" : "Figure2"],
        ["title" : "Influence of direct thrombin inhibitors on coagulation tests", "filename" : "P-Blue-Darker", "figurename" : ""],
        ["title" : "Outlook", "filename" : "P-Blue-Darker", "figurename" : "Figure4"],
        ["title" : "References", "filename" : "References", "figurename" : ""],
        ]
    
    
    @IBOutlet var collectionView : UICollectionView!
    
    
    private func setupUI() {
        let layout = collectionView.collectionViewLayout as! iHGridLayout
        layout.itemHeight = 280.0
        
        if (self.practicalManualType == Utils.PracticalManualType.AntiphospholipidSyndrome) {
            self.setScreenTitle(title: "Antiphospholipid Syndrome - Summary")
        }
        else {
            self.setScreenTitle(title: "Parenteral Anticoagulants - Summary")
        }
        
        
        let backbuttonImage: UIImage? = UIImage(named: "Back-ArrowWHITE")
        let backButton:UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        backButton.frame = CGRect(0, 0, 32, 32)
        backButton.addTarget(self, action: Selector("backButtonAction"), for: UIControl.Event.touchUpInside)
        backButton.setTitle("", for: UIControl.State.normal)
        backButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
        backButton.setBackgroundImage(backbuttonImage, for: .normal)
        
        self.abbreviationButton?.isHidden = self.practicalManualType == Utils.PracticalManualType.AntiphospholipidSyndrome
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadUI(size: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        reloadUI(size: size)
    }
    
    func reloadUI(size: CGSize) {
        var isLandscape = false
        
        let orient = UIApplication.shared.statusBarOrientation
        
        switch orient {
        case .portrait:
            isLandscape = false
        default:
            isLandscape = true
        }
        
        let layout = collectionView.collectionViewLayout as! iHGridLayout
        if (isLandscape) {
            layout.numberOfColumns = 3
            layout.minimumInteritemSpacing = 10.0
        }
        else {
            layout.numberOfColumns = 3
            layout.minimumInteritemSpacing = 10.0
        }
        layout.sectionInset = UIEdgeInsets(
            top: 20.0,
            left: layout.minimumInteritemSpacing,
            bottom: 20.0,
            right: layout.minimumInteritemSpacing);
        
        layout.invalidateLayout()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return practicalManualChapters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPracticalManualChapterCellIdentifier, for: indexPath as IndexPath) as! iHPracticalManualChapterCell
        let index = indexPath.item
        let element = practicalManualChapters[index]
        var attributedText = cell.descriptionTextView.attributedText.mutableCopy() as! NSMutableAttributedString
        attributedText.mutableString.setString(element["description"]!)
        cell.descriptionTextView.attributedText = NSAttributedString(attributedString: attributedText)
        
        attributedText = cell.entityTextView.attributedText.mutableCopy() as! NSMutableAttributedString
        attributedText.mutableString.setString(element["entity"]!)
        cell.entityTextView.attributedText = NSAttributedString(attributedString: attributedText)
        
        cell.titleLabel.text = element["title"]!
        cell.titleLabel.font  = UIFont(name: Utils.SCREEN_TITLE_FONT_NAME, size: 20)
        
        attributedText = cell.authorTextView.attributedText.mutableCopy() as! NSMutableAttributedString
        attributedText.mutableString.setString(element["author"]!)
        cell.authorTextView.attributedText = NSAttributedString(attributedString: attributedText)
        
        
        switch indexPath.row {
        case 0:
            cell.titleView.backgroundColor = Utils.colorWithHexString(hex: element["colour"]!)
        case 1:
            cell.titleView.backgroundColor = Utils.colorWithHexString(hex: element["colour"]!)
        case 2:
            cell.titleView.backgroundColor = Utils.colorWithHexString(hex: element["colour"]!)
        case 3:
            cell.titleView.backgroundColor = Utils.colorWithHexString(hex: element["colour"]!)
        default:
            cell.titleView.backgroundColor = Utils.colorWithHexString(hex: element["colour"]!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let practicalManualDetailViewController = storyBoard.instantiateViewController(withIdentifier: "PracticalManualDetailViewController") as! PracticalManualDetailViewController
        
        if (self.practicalManualType == Utils.PracticalManualType.AntiphospholipidSyndrome) {
            switch indexPath.row {
            case 0:
                practicalManualDetailViewController.contextMenuPointer = contextMenuPathophysiologyList
            case 1:
                practicalManualDetailViewController.contextMenuPointer = contextMenuClinicalManifList
            case 2:
                practicalManualDetailViewController.contextMenuPointer = contextMenuLaboratoryDiagnosisImmunoList
            case 3:
                practicalManualDetailViewController.contextMenuPointer = contextMenuLaboratoryDiagnosisLupusList
            case 4:
                practicalManualDetailViewController.contextMenuPointer = contextMenuLaboratoryDiagnosisAppList
            case 5:
                practicalManualDetailViewController.contextMenuPointer = contextMenuManagementPatientsList
            default:
                practicalManualDetailViewController.contextMenuPointer = contextMenuPathophysiologyList
            }
        }
        else if (self.practicalManualType == Utils.PracticalManualType.ParenteralAnticoagulants) {
            switch indexPath.row {
            case 0:
                practicalManualDetailViewController.contextMenuPointer = contextMenuUnfractionatedHeparinList
            case 1:
                practicalManualDetailViewController.contextMenuPointer = contextMenuLowMolecularList
            case 2:
                practicalManualDetailViewController.contextMenuPointer = contextMenuHeparinInducedList
            case 3:
                practicalManualDetailViewController.contextMenuPointer = contextMenuFondaparinux
            case 4:
                practicalManualDetailViewController.contextMenuPointer = contextMenuDenaparoid
            case 5:
                practicalManualDetailViewController.contextMenuPointer = contextMenuDirectThrombin
            default:
                practicalManualDetailViewController.contextMenuPointer = contextMenuUnfractionatedHeparinList
            }
        }
        
        let element = practicalManualChapters[indexPath.row]
        // C'est con!! Pour application of current guidelines, c'est un titre personnalisé. là je dois bricoler pour accomplir ca !
        if practicalManualDetailViewController.contextMenuPointer == contextMenuLaboratoryDiagnosisAppList {
            practicalManualDetailViewController.setScreenTitle(title: "Lupus anticoagulant - Current guidelines")
        }
        else {
            practicalManualDetailViewController.setScreenTitle(title: (element["title"]?.replacingOccurrences(of:"\n", with: " "))!)
        }
        
        self.navigationController!.pushViewController(practicalManualDetailViewController, animated: true)
        self.navigationController!.navigationBar.topItem?.title = "     "
    }
    
    @IBAction func abbreviationButtonAction(sender: UIButton) {
        
    }
}
