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
    
    // Oral Anticoagulant
    var contextVitaminKAntagonists = [
        ["title" : "Background - History", "filename" : "O-Orange"],
        ["title" : "Pharmacodynamics and pharmacokinetics of VKA"],
        ["title" : "INR monitoring and target INR"],
        ["title" : "Intra- and interindividual variability of the dose response to VKA"],
        ["title" : "Treatment initiation, dose regimens and anticoagulation control"],
        ["title" : "Adverse events, management of overdose, bleeding events and reversal"],
        ["title" : "Special populations"],
        ["title" : "Conclusion"],
        ["title" : "Take home messages"],
        ["title" : "References"]
    ]
    
    var contextDabigatranExilatePharma = [
         ["title" : "Introduction", "filename" : "O-LightBlue"],
         ["title" : "Thrombin as a target for anticoagulants"],
         ["title" : "Direct thrombin inhibitors"],
         ["title" : "Properties and pharmacology of dabigatran etexilate"],
         ["title" : "Clinical development program"],
         ["title" : "Practical management of dabigatran"],
         ["title" : "Conclusion"],
         ["title" : "References"],
    ]
    
    var contextDabiagatranExilateClinical = [
        ["title" : "Introduction", "filename" : "O-Purple"],
        ["title" : "What test to use to determine the presence and the plasma concentration of dabigatran?"],
        ["title" : "Impact of direct oral anticoagulants on coagulation function assessments"],
        ["title" : "Discussion and conclusions"],
        ["title" : "Key points"],
        ["title" : "References"],
    ]
    
    var contextDirectFactorPharma = [
        ["title" : "Introduction", "filename" : "O-Marrown"],
        ["title" : "Pharmacological aspects"],
        ["title" : "Clinical Indications"],
        ["title" : "References"],
    ]
    
    var contextDirectFactorClinical = [
        ["title" : "Introduction", "filename" : "O-red"],
        ["title" : "Effect of anti-Xa DOAC on haemostasis tests"],
        ["title" : "Measurement of DOAC concentrations"],
        ["title" : "References"],
    ]
    
    var contextReversal = [
        ["title" : "Introduction", "filename" : "O-blue"],
        ["title" : "Bleeding risk and reversal of anticoagulant effect of direct oral anticoagulants"],
        ["title" : "Reversal of direct oral factor Xa inhibitors"],
        ["title" : "Reversal of direct oral IIa (thrombin) inhibitors"],
        ["title" : "Conclusion"],
        ["title" : "References"],
    ]
    
    var contextPeriprocedural = [
        ["title" : "Introduction", "filename" : "O-purpleTwo"],
        ["title" : "When not to stop anticoagulation?"],
        ["title" : "How to estimate bleeding and thromboembolic risk?"],
        ["title" : "If bridging is elected, how to bridge?"],
        ["title" : "Direct oral anticoagulants"],
        ["title" : "Conclusion"],
        ["title" : "Take home messages"],
        ["title" : "References"],
    ]
    
    var contextThrombolysis = [
        ["title" : "Anticoagulation and stroke", "filename" : "O-green"],
        ["title" : "Intravenous thrombolysis and endovascular treatment"],
        ["title" : "Patients taking vitamin-K antagonists"],
        ["title" : "Patients taking direct oral anticoagulants"],
        ["title" : "References"],
    ]
    
    //Bleeding
    var contextHaemophiliaPharma = [
        ["title" : "Introduction", "filename" : "B-Orange"],
        ["title" : "Diagnosis of haemophilia"],
        ["title" : "Clinical manifestations"],
        ["title" : "Treatment"],
        ["title" : "Inhibitors"],
        ["title" : "Do's and Don'ts"],
        ["title" : "References"],
    ]
    
    var contextHaemophiliaClinical = [
        ["title" : "Introduction", "filename" : "B-LightBlue"],
        ["title" : "Preanalytical issues"],
        ["title" : "Basic laboratory assays"],
        ["title" : "Second-level laboratory assays"],
        ["title" : "New and emerging issues in the laboratory evaluation of haemophilia"],
        ["title" : "Conclusion"],
        ["title" : "References"],
    ]
    
    var contextVonWillebrandAspect = [
        ["title" : "Introduction", "filename" : "B-Purple"],
        ["title" : "Prevalence"],
        ["title" : "Pathophysiology"],
        ["title" : "Inheritance"],
        ["title" : "Diagnosis"],
        ["title" : "Clinical symptoms"],
        ["title" : "Treatment"],
        ["title" : "Complications of treatment"],
        ["title" : "Conclusion"],
        ["title" : "References"],
    ]
    
    var contextVonWillebrandLaboratory = [
         ["title" : "Introduction", "filename" : "B-Marrown"],
         ["title" : "VWD screening tests"],
         ["title" : "VWF activity: the interaction with platelet GPIbα"],
         ["title" : "VWF activity: the interaction with collagen"],
         ["title" : "VWF activity: the interaction with FVIII"],
         ["title" : "VWF multimer assessments"],
         ["title" : "VWF propeptide"],
         ["title" : "VWF gene sequencing"],
         ["title" : "Flowchart for clinical laboratory to correctly diagnose and classify specific types of VWD"],
         ["title" : "References"],
    ]
    
    var contextRarebleed = [
        ["title" : "Perspectives", "filename" : "B-Red"],
        ["title" : "Strategies for diagnosis"],
        ["title" : "RBD associated with fibrinogen abnormalities"],
        ["title" : "RBD associated with other coagulation test abnormalities"],
        ["title" : "RBD associated with primary defects in clot stabilisation"],
        ["title" : "RBD due to fibrinolytic defects"],
        ["title" : "Selected papers of interest"],
    ]
    
    var contextAcquired = [
        ["title" : "Introduction", "filename" : "B-blue"],
        ["title" : "Pathophysiology"],
        ["title" : "Laboratory diagnosis"],
        ["title" : "Treatment"],
        ["title" : "Take home messages"],
        ["title" : "Selected papers of interest"],
    ]
    
    var contextManagement = [
        ["title" : "Management of von Willebrand disease", "filename" : "B-PurpleTwo"],
        ["title" : "Management of haemophilia"],
        ["title" : "Management of less common congenital disorders of haemostasis"],
        ["title" : "References"],
        ["title" : "Additional papers of interest"]
    ]
    
    var contextBleeding = [
        ["title" : "Introduction", "filename" : "B-green"],
        ["title" : "Principles of peri-operative management"],
        ["title" : "Pre-operative planning for heritable bleeding disorders"],
        ["title" : "Specific recommendations according to bleeding disorders"],
        ["title" : "Conclusion"],
        ["title" : "References"]
    ]
    //Platelets
    var contextPhysiology = [
        ["title" : "Introduction", "filename" : "Platelets-Orange"],
        ["title" : "Platelet structure"],
        ["title" : "Platelet receptors"],
        ["title" : "Platelet formation and lifespan"],
        ["title" : "Platelets in haemostasis and thrombosis"],
        ["title" : "Thrombosis"],
        ["title" : "Non-haemostatic functions of platelets"],
        ["title" : "Key messages"],
        ["title" : "References"],
    ]
    
    var contextTrombocytopenia = [
        ["title" : "Congenital thrombocytopenia", "filename" : "Platelets-LightBlue"],
        ["title" : "Immune thrombocytopenia (ITP)"],
        ["title" : "Alloimmune thrombocytopenia"],
        ["title" : "Drug-induced thrombocytopenia"],
        ["title" : "Thrombocytopenia in pregnancy"],
        ["title" : "Thrombotic thrombocytopenic"],
        ["title" : "References"],
    ]
    
    var contextThrombocythemia = [
        ["title" : "Introduction", "filename" : "Platelets-purple"],
        ["title" : "Clinical presentation"],
        ["title" : "Management of Essential Thrombocythemia"],
        ["title" : "Paediatric thrombocythemia"],
        ["title" : "Conclusions"],
        ["title" : "References"],
    ]
    
    var contextCongenital = [
         ["title" : "Introduction", "filename" : "Platelets-Marrown"],
         ["title" : "Normal platelet count and abnormal aggregation"],
         ["title" : "Normal platelet count and normal aggregation"],
         ["title" : "Thrombocytopenia with small platelets and platelet dysfunction"],
         ["title" : "Thrombocytopenia with normal-size platelets and platelet dysfunction"],
         ["title" : "Thrombocytopenia with large or giant platelets and platelet dysfunction"],
         ["title" : "Management of patients with platelet function disorders"],
         ["title" : "Conclusion"],
         ["title" : "References"],
    ]
    
    var contextAcquiredPlatelet = [
        ["title" : "Introduction", "filename" : "Platelets-Red"],
        ["title" : "Major tyrosine kinases involved in the platelet signalling machinery"],
        ["title" : "Acquired platelet disorders induced by clinically available TKIs"],
        ["title" : "Conclusion"],
        ["title" : "References"],
    ]
    
    var contextLaboratory = [
        ["title" : "Introduction", "filename" : "Platelets-Blue"],
        ["title" : "Blood counts and assessment of the blood film by light microscopy"],
        ["title" : "Immunostaining of the blood film to assess for specific platelet disorders"],
        ["title" : "Bleeding time and closure times"],
        ["title" : "Platelet aggregometry"],
        ["title" : "Interpretation of aggregation findings"],
        ["title" : "Whole mount electron microscopy assessments for platelet dense granule deficiency"],
        ["title" : "Others methods to assess platelet function"],
        ["title" : "Concluding remarks"],
        ["title" : "Selected papers of interest"],
    ]
    
    var contextViscoelastrography = [
        ["title" : "Introduction", "filename" : "Platelets-Purple2"],
        ["title" : "Rotational VE methods"],
        ["title" : "Non-rotational VE methods"],
        ["title" : "Clinical studies"],
        ["title" : "Conclusion"],
        ["title" : "References"]
    ]
    
    var contextAntiplatelet = [
        ["title" : "Background", "filename" : "Platelets-Green"],
        ["title" : "Cyclooxygenase (COX)-1 inhibition: aspirin"],
        ["title" : "Antiplatelet agents targeting the P2Y12-receptor"],
        ["title":"Glycoprotein"],
        ["title" : "Novel antiplatelet agents"],
        ["title" : "Conclusion"],
        ["title" : "References"]
    ]
    var contextPerioperative = [
        ["title" : "Introduction", "filename" : "Platelets-Green2"],
        ["title" : "Antiplatelet therapy and bleeding and ischaemia in cardiac and non-cardiac surgery"],
        ["title" : "Dual antiplatelet therapy"],
        ["title" : "Association between on-treatment platelet reactivity and bleeding in cardiac and non-cardiac surgery"],
        ["title" : "Perioperative management of cardiac and non-cardiac surgery"],
        ["title" : "Conclusion"],
        ["title" : "References"]
    ]
    //Livre6
    var livre6chap1 = [
        ["title" : "Epidemiology of DVT", "filename" : "livre6-blue"],
        ["title" : "Clinical manifestations"],
        ["title" : "DVT diagnosis"],
        ["title" : "References"],
    ]
    var livre6chap2 = [
        ["title" : "Clinical presentation", "filename" : "livre6-orange"],
        ["title" : "Decision rules"],
        ["title" : "Management"],
        ["title" : "Conclusion"],
        ["title" : "References"],
    ]
    var livre6chap3 = [
        ["title" : "Background", "filename" : "livre6-blue2"],
        ["title" : "Hypercoagulability and VTE"],
        ["title" : "Contact pathway activation and VTE development"],
        ["title" : "Circulating blood cells and VTE"],
        ["title" : "Endothelial dysfunction and VTE"],
        ["title" : "Blood stasis and VTE"],
        ["title" : "Summary"],
        ["title" : "References"],
       
    ]
    var livre6chap4 = [
        ["title" : "Introduction", "filename" : "livre6-purple"],
        ["title" : "Factor V Leiden"],
        ["title" : "Prothrombin G20210A mutation"],
        ["title" : "Antithrombin deficiency"],
        ["title" : "Protein C deficiency"],
        ["title" : "Protein S deficiency"],
        ["title" : "Factor VIII elevation"],
        ["title" : "Dysfibrinogenemia"],
        ["title" : "Abnormalities of fibrinogenolysis"],
        ["title" : "References"],
    ]
    var livre6chap5 = [
        ["title" : "Introduction", "filename" : "livre6-gray"],
        ["title" : "Inherited deficiencies of coagulation regulators:antithrombin, protein C, and protein S"],    ["title" : "Inherited thrombophilia and coagulation factors"],
        ["title" : "Activated protein C resistance and factor V Leiden"],
        ["title" : "Prothrombin gene 20210 polymorphism"],
        ["title" : "Factor VIII activity"],
        ["title" : "Thrombophilia testing interference from direct oral anticoagulants"],
        ["title" : "References"],
    ]
    var livre6chap6 = [
        ["title" : "Thrombophilia testing: when and who to test?", "filename" : "livre6-gray2"],
        ["title" : "Thrombophilia: who to test"],
        ["title" : "Thrombophilia: what to test"],
        ["title" : "Thrombophilia: when to test"],
        ["title" : "Take home message"],
        ["title" : "References"],
    ]
    var livre6chap7 = [
        ["title" : "Epidemiology", "filename" : "livre6-red"],
        ["title" : "Demographic and clinical risk factors"],
        ["title" : "Location of VTE and influence of initial treatment"],
        ["title" : "Residual vein thrombosis"],
        ["title" : "Malignancy"],
        ["title" : "Thrombophilia"],
        ["title" : "Biomarkers"],
        ["title" : "Risk assessment scores for recurrent VTE"],
        ["title" : "Take home messages"],["title" : "References"],
    ]
    var livre6chap8 = [
        ["title" : "Epidemiology and biological mechanisms", "filename" : "livre6-blue3"],
        ["title" : "Management of VTE in pregnancy"],
        ["title" : "References"],
    ]
    var livre6chap9 = [
        ["title" : "Epidemiology", "filename" : "livre6-purple2"],
        ["title" : "Location of VTE in children"],
        ["title" : "Clinical presentation and diagnosis"],
        ["title" : "Clinical consequences"],
        ["title" : "Laboratory work-up"],
        ["title" : "Treatment and prevention"],
        ["title" : "References"],
    ]
    var livre6chap10 = [
        ["title" : "Epidemiology", "filename" : "livre6-green"],
        ["title" : "Risk factors"],
        ["title" : "Pathophysiology"],
        ["title" : "Management"],
        ["title" : "References"],
    ]
    var livre6chap11 = [
        ["title" : "Epidemiology of VTE in older adults", "filename" : "livre6-green2"],
        ["title" : "Diagnosis of VTE in older adults"],
        ["title" : "Treatment of VTE in older adults"],
        ["title" : "Summary"],
        ["title" : "References"],
    ]
    
    
    //Livre 7 Immuno

    var livre7chap1 = [
        ["title" : "Prologue", "filename" : "immunochap1"],
        ["title" : "Introduction"],
        ["title" : "Platelets, Hemostasis, and Immunothrombosis"],
        ["title" : "Platelets and Host Immunity"],
        ["title" : "Platelet-Mediated Immune Modulation"],
        ["title" : "Platelet-Mediated Pathogen Detection and Clearance"],
        ["title" : "Clinical Perspective and Summary"],
        ["title" : "References"]
        
    ]
    var livre7chap2 = [
        ["title" : "DAMPs and PAMPs release during infection", "filename" : "immunochap2"],
        ["title" : "Dual role of immunothrombosis: bacterial killing versus thrombosis and organ damage"],
        ["title" : "DAMPs as major triggers of platelet activation"],
        ["title" : "Comorbidities and platelet response to DAMPs and PAMPs"],
        ["title" : "Conclusion and future perspectives"],
        ["title" : "Key points"],
        ["title" : "References"],
 
    ]
    var livre7chap3 = [
        ["title" : "Endothelial dysfunction and immunothrombosis", "filename" : "immunochap3"],
        ["title" : "Endothelial cell activation and leukocyte recruitment"],
        ["title" : "Dysregulation of endogenous endothelial anticoagulant pathways"],
        ["title" : "Dual role of coagulation protease signalling in modulating endothelial function"],
        ["title" : "The role of NETosis in endothelial injury"],
        ["title" : "Endothelial VWF release – bystander or pro-inflammatory agent?","class":"Endo"],
        ["title" : "Vascular inflammation impairs endothelial fibrinolytic activity"],
        ["title" : "Endothelial injury in acute inflammatory disease"],
        ["title" : "Conclusions"],
        ["title" : "Key points"],
        ["title" : "References"],
       
    ]
    var livre7chap4 = [
        ["title" : "Fibrinolysis", "filename" : "immunochap4"],
        ["title" : "Platelets"],
        ["title" : "Monocyte/Macrophages"],
        ["title" : "Neutrophils"],
        ["title" : "Endothelium"],
        ["title" : "Fibrinolytic dysregulation during infection"],
        ["title" : "Targeting the fibrinolytic pathway for infection and immune modulation"],
        ["title" : "Summary"],
        ["title" : "Key points"],
        ["title" : "References"],
    ]
    var livre7chap5 = [
        ["title" : "Introduction", "filename" : "immunochap5"],
        ["title" : "Inflammation and CRP"],    ["title" : "CRP structure and function"],
        ["title" : "CRP, immunothrombosis and COVID-19"],
        ["title" : "CRP and atherothrombosis"],
        ["title" : "CRP and VTE"],
        ["title" : "CRP and cancer-associated thrombosis (CAT)"],
        ["title" : "Summary and perspectives"],
        ["title" : "References"],
    ]
    var livre7chap6 = [
        ["title" : "Introduction", "filename" : "immunochap6"],
        ["title" : "Immunothrombotic pathways contributing to COVID-19 pathophysiology"],
        ["title" : "Clinical interventions targeting immunothrombosis in COVID-19"],
        ["title" : "Persistent immunothrombosis in Long-COVID"],
        ["title" : "Perspectives"],
        ["title" : "Key points"],
        ["title" : "References"],
    ]
    var livre7chap7 = [
        ["title" : "Overview", "filename" : "immunochap7"],
        ["title" : "Pathology of Sepsis"],
        ["title" : "Definition and assessment of sepsis"],
        ["title" : "Mechanisms of prothrombotic processes in sepsis"],
        ["title" : "Mechanisms of immunothrombosis in sepsis"],
        ["title" : "Immunothrombotic and haemostatic dysregulations at later stages of sepsis"],
        ["title" : "Treatment options of haemostatic complications in sepsis"],
        ["title" : "Key points"],
        ["title" : "References"],
    ]
    var livre7chap8 = [
        ["title" : "Introduction to NETs and their function", "filename" : "immunochap8"],
        ["title" : "Methodologies used to study NETs"],
        ["title" : "NETs and thrombosis"],
        ["title" : "References"],
       
    ]
    var livre7chap9 = [
        ["title" : "Aims", "filename" : "immunochap9"],
        ["title" : "Introduction"],
        ["title" : "Current tests for immunothrombosis"],
        ["title" : "Specific haemostatic tests"],
        ["title" : "The future in testing for global immunothrombosis"],
        ["title" : "References"],
    ]
    
    @IBOutlet var collectionView : UICollectionView!
    
    
    private func setupUI() {
        let layout = collectionView.collectionViewLayout as! iHGridLayout
        layout.itemHeight = 280.0
        var title:String = ""
        if (self.practicalManualType == Utils.PracticalManualType.AntiphospholipidSyndrome) {
                title = "Antiphospholipid Syndrome - Summary"
              
           
        }
        else if (self.practicalManualType == Utils.PracticalManualType.ParenteralAnticoagulants){
            title = "Parenteral Anticoagulants - Summary"
        }else if (self.practicalManualType == Utils.PracticalManualType.OralAnticoagulants){
            title = "Oral Anticoagulants - Summary"
        }else if(self.practicalManualType==Utils.PracticalManualType.BleedingDisorders){
            title = "Bleeding disorders - Summary"
        }
        else if(self.practicalManualType==Utils.PracticalManualType.Platelets){
            title = "Platelets - Summary"
        }
        else if(self.practicalManualType==Utils.PracticalManualType.Livre6){
            title = "Venous Thromboembolism - Summary"
        }
        if(UIDevice.current.userInterfaceIdiom == .phone){
            self.setScreenTitle(title:title,fontsize: 23)
        }else{
            self.setScreenTitle(title:title)
        }
      
        
        let backbuttonImage: UIImage? = UIImage(named: "Back-ArrowWHITE")
        let backButton:UIButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        backButton.frame = CGRect(0, 0, 32, 32)
        backButton.addTarget(self, action: #selector(backButtonAction), for: UIControl.Event.touchUpInside)
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
    override func viewDidAppear(_ animated: Bool) {
      
      super.viewDidAppear(animated)
        AppDelegate.lockScreenIphone()
    
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if(UIDevice.current.userInterfaceIdiom == .phone){
            return UIInterfaceOrientationMask.portrait
        }
        else{
            return UIInterfaceOrientationMask.all
            
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        AppDelegate.lockScreenIphone()
 
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
            if(UIDevice.current.userInterfaceIdiom == .phone){
                layout.numberOfColumns = 1
                layout.minimumInteritemSpacing = 20.0
            }
        }
        else {
            if(UIDevice.current.userInterfaceIdiom == .phone){
                layout.numberOfColumns = 1
            }else{
                layout.numberOfColumns = 3
            }
            
          
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
        
        cell.entityTextView.textContainer.maximumNumberOfLines = 8
        
         cell.entityTextView.textContainer.lineBreakMode = .byTruncatingTail
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
        let storyBoard : UIStoryboard
        if(UIDevice.current.userInterfaceIdiom == .phone){
            storyBoard =  UIStoryboard(name: "Main-iphone", bundle:nil)
        }else{
            storyBoard =  UIStoryboard(name: "Main", bundle:nil)
        }
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
        }else if (self.practicalManualType == Utils.PracticalManualType.OralAnticoagulants) {
            switch indexPath.row {
            case 0:
                practicalManualDetailViewController.contextMenuPointer = contextVitaminKAntagonists
            case 1:
                practicalManualDetailViewController.contextMenuPointer = contextDabigatranExilatePharma
            case 2:
                practicalManualDetailViewController.contextMenuPointer = contextDabiagatranExilateClinical
            case 3:
                practicalManualDetailViewController.contextMenuPointer = contextDirectFactorPharma
            case 4:
                practicalManualDetailViewController.contextMenuPointer = contextDirectFactorClinical
            case 5:
                practicalManualDetailViewController.contextMenuPointer = contextReversal
            case 6:
                practicalManualDetailViewController.contextMenuPointer = contextPeriprocedural
            case 7:
                practicalManualDetailViewController.contextMenuPointer = contextThrombolysis
            default:
                practicalManualDetailViewController.contextMenuPointer = contextVitaminKAntagonists
            }
        }else if(self.practicalManualType == Utils.PracticalManualType.BleedingDisorders){
            switch indexPath.row{
                case 0:
                    practicalManualDetailViewController.contextMenuPointer = contextHaemophiliaPharma
                case 1:
                    practicalManualDetailViewController.contextMenuPointer = contextHaemophiliaClinical
                case 2:
                    practicalManualDetailViewController.contextMenuPointer = contextVonWillebrandAspect
                case 3:
                    practicalManualDetailViewController.contextMenuPointer = contextVonWillebrandLaboratory
                case 4:
                    practicalManualDetailViewController.contextMenuPointer = contextRarebleed
                case 5:
                    practicalManualDetailViewController.contextMenuPointer = contextAcquired
                case 6:
                    practicalManualDetailViewController.contextMenuPointer = contextManagement
                case 7:
                    practicalManualDetailViewController.contextMenuPointer = contextBleeding
                default:
                    practicalManualDetailViewController.contextMenuPointer = contextHaemophiliaPharma
            }
            
            
        }
        //Platelets
        else if(self.practicalManualType == Utils.PracticalManualType.Platelets){
            switch indexPath.row{
                case 0:
                    practicalManualDetailViewController.contextMenuPointer = contextPhysiology
                case 1:
                    practicalManualDetailViewController.contextMenuPointer = contextTrombocytopenia
                case 2:
                    practicalManualDetailViewController.contextMenuPointer = contextThrombocythemia
                case 3:
                    practicalManualDetailViewController.contextMenuPointer = contextCongenital
                case 4:
                    practicalManualDetailViewController.contextMenuPointer = contextAcquiredPlatelet
                case 5:
                    practicalManualDetailViewController.contextMenuPointer = contextLaboratory
                case 6:
                    practicalManualDetailViewController.contextMenuPointer = contextViscoelastrography
                case 7:
                    practicalManualDetailViewController.contextMenuPointer = contextAntiplatelet
                case 8:
                    practicalManualDetailViewController.contextMenuPointer = contextPerioperative
                default:
                    practicalManualDetailViewController.contextMenuPointer = contextPhysiology
            }
            
            
        }
        else if(self.practicalManualType == Utils.PracticalManualType.Livre6){
            switch indexPath.row{
                case 0:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap1
                case 1:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap2
                case 2:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap3
                case 3:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap4
                case 4:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap5
                case 5:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap6
                case 6:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap7
                case 7:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap8
                case 8:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap9
                case 9:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap10
                case 10:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap11
                default:
                    practicalManualDetailViewController.contextMenuPointer = livre6chap1
            }
            
            
        }
        else if(self.practicalManualType == Utils.PracticalManualType.Immuno){
            switch indexPath.row{
                case 0:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap1
                case 1:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap2
                case 2:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap3
                case 3:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap4
                case 4:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap5
                case 5:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap6
                case 6:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap7
                case 7:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap8
                case 8:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap9
                default:
                    practicalManualDetailViewController.contextMenuPointer = livre7chap1
            }
            
            
        }
        
        let element = practicalManualChapters[indexPath.row]
        // C'est con!! Pour application of current guidelines, c'est un titre personnalisé. là je dois bricoler pour accomplir ca !
        if practicalManualDetailViewController.contextMenuPointer == contextMenuLaboratoryDiagnosisAppList {
            if(UIDevice.current.userInterfaceIdiom == .phone){
                practicalManualDetailViewController.setScreenTitle(title: "Lupus anticoagulant - Current guidelines",fontsize: 23.0)
            }else{
                practicalManualDetailViewController.setScreenTitle(title: "Lupus anticoagulant - Current guidelines")
            }
            
        }
        else {
            if(UIDevice.current.userInterfaceIdiom == .phone){
                practicalManualDetailViewController.setScreenTitle(title: (element["title"]?.replacingOccurrences(of:"\n", with: " "))!,fontsize: 23.0)
            
            }else{
                practicalManualDetailViewController.setScreenTitle(title: (element["title"]?.replacingOccurrences(of:"\n", with: " "))!)
            
            }
         }
        
        self.navigationController!.pushViewController(practicalManualDetailViewController, animated: true)
        self.navigationController!.navigationBar.topItem?.title = "     "
    }
    
    @IBAction func abbreviationButtonAction(sender: UIButton) {
        let storyBoard : UIStoryboard
        if(UIDevice.current.userInterfaceIdiom == .phone){
            storyBoard =  UIStoryboard(name: "Main-iphone", bundle:nil)
        }else{
            storyBoard =  UIStoryboard(name: "Main", bundle:nil)
        }
        let practicalManualAbbreviationViewController = storyBoard.instantiateViewController(withIdentifier: "PracticalManualAbbreviationViewController") as! PracticalManualAbbreviationViewController
        practicalManualAbbreviationViewController.practicalManualType = self.practicalManualType
        self.navigationController!.pushViewController(practicalManualAbbreviationViewController, animated: true)
    }
}
