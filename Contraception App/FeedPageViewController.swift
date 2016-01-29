//
//  FeedPageViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 6/2/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit
import Parse
import Bolts

let cellID = "cell"
class FeedPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var yesButton2: UIButton!
    
    @IBOutlet weak var noButton2: UIButton!
    
    @IBOutlet weak var moreLabel2: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedFeedTitle = String()
    var selectedFeedFeedContent = String()
    
    var IUDQuestionsArray = [NSLocalizedString("What is it?", comment: ""),NSLocalizedString("There are two types of IUDs:", comment: ""),NSLocalizedString("What can I expect when the IUD is inserted?", comment: ""), NSLocalizedString("Are there advantages in using an IUD?", comment: ""), NSLocalizedString("Are there disadvantages in using an IUD?", comment: ""), NSLocalizedString("How do I get an IUD?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while having an IUD?", comment: "")]
    
    var IUDInfoArray = [NSLocalizedString("\u{2022} An IUD is a small, soft, flexible T-shaped device that is wrapped in copper or contains hormones. A health care provider puts it into your uterus or womb through your vagina.\n\n\u{2022} A thin plastic string tied to the end of the IUD hangs down through the cervix (the lower end of your uterus or womb) into the vagina. You can check that the IUD is in place by feeling for this string every month. Your sex partner cannot feel the string during sex. The string is also used by your healthcare provider to take the IUD out.", comment: ""), NSLocalizedString("<b>Copper IUD</b> \n\n\u{2022} The copper IUD goes by the brand name ParaGard®. It lets go of a small amount of copper into the uterus that makes the uterus and fallopian tubes (tubes that go from the ovaries to the uterus) make a fluid that kills sperm. Killing the sperm prevents them from reaching and fertilizing the egg. \n\n\u{2022} If fertilization does occur, the IUD keeps anything from attaching to the uterus and growing. It can stay in your uterus for up to 10 years, but it can be taken out at any time. \n\n\u{2022} It does not have hormones in it. \n\n\u{2022} It begins working as soon as it is put into your uterus and you can get pregnant as soon as it is taken out. \n\n<b>Hormonal IUD</b> \n\n\u{2022} The hormonal IUD that slowly lets go of a hormone called progestin into the uterus. \n\n\u{2022}There are 2 types of hormonal IUDs: Mirena® and Skyla®. \n\n\u{2022} It is sometimes called an intrauterine system, or IUS. \n\n\u{2022} The progestin works in 3 ways: It thickens the mucus of your cervix, which keeps sperm from meeting with the egg. It changes the lining of your uterus so that nothing can attach to the uterus and grow. It may stop the ovaries from letting eggs go. Then an egg cannot meet a sperm. \n\n\u{2022} It may reduce bleeding and cramping with your periods. Your period may not be regular or it may stop completely. These effects will continue as long as you have the hormonal IUD in place. \n\n\u{2022}A hormonal IUD can stay in your uterus for up to 5 years (Mirena® – 5 years; Sklya® – 3 years), but it can be taken out at any time. Your period will begin soon after the IUD is taken out.", comment: ""), NSLocalizedString("\u{2022} Putting in an IUD only takes a few minutes and can be done in the health care provider’s office. \n\n\u{2022} When it is put in, you might feel a little pinching or cramping. \n\n\u{2022} Light cramping and spotting may occur for 1-2 days after it is put in. \n\n\u{2022} You may return to your normal daily routine after the IUD is put in.", comment: ""), NSLocalizedString("\u{2022} An IUD is very good in preventing pregnancy for a long period of time. \n\n\u{2022} Having an IUD is easy, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using an IUD unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} Your partner will not feel an IUD during sex or know that it is there. \n\n\u{2022} It is safe to use if you are breastfeeding \n\n\u{2022} An IUD can be taken out if you have problems or want to stop using it. You can get pregnant soon after it is removed.", comment: ""), NSLocalizedString("\u{2022} It may cost more, but the costs may be reduced or free at a community clinic or if you have health insurance. It also costs to have the IUD removed. However, if an IUD is used for 5 years or longer, it is the cheapest form of birth control. \n\n\u{2022} The IUD does NOT protect against sexually STDs, including HIV (the virus that causes AIDS) or herpes. If you are not sure if your sex partner has a STD or not, use a condom to help protect against infection. \n\n\u{2022} You are checked for STDs before getting an IUD to prevent any infection from moving from your vagina into your uterus. \n\n\u{2022} For the copper IUD, you might have heavier, longer periods, and some spotting between periods for a few months. After about four months, your body gets used to having the copper IUD in place. \n\n\u{2022} The hormonal IUD can cause hormonal side effects like those caused by any birth control method that contains progestin such nausea, headaches, and dizziness. When side effects do happen, they usually go away after the first few months.", comment: ""), NSLocalizedString("\u{2022}A health care provider puts it into your uterus during an office visit. \n\n\u{2022} After it is put in, you only need to do monthly string checks at home. \n\n\u{2022} To do a monthly string check, put a finger into your vagina and feel for the cervix, which is at the top of the vagina and feels harder than the rest of your vagina (some women say it feels like the tip of your nose). You should be able to feel the thin, plastic string coming out of the opening of your cervix. It may be wrapped around the cervix, which can make it hard to find. \n\n\u{2022} If you cannot feel the string, it does not always mean that the IUD has come out of the uterus. Use another form of birth control until your health care provider makes sure that the IUD is still in place. \n\n\u{2022} If you have no problems, check the string after each period and return to your doctor once a year for a checkup.", comment: ""), NSLocalizedString("\u{2022}Using an IUD is one of the best methods of birth control. \n\n\u{2022} Out of 100 women who use this method, less than 1 woman gets pregnant.", comment: "")]
    
    var implantQuestionsArray = [NSLocalizedString("What is it?", comment: ""), NSLocalizedString("Are there advantages in using an implant?", comment: ""), NSLocalizedString("Are there disadvantages in using an implant?", comment: ""), NSLocalizedString("How do I get it?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while having an implant?", comment: "")]
    
    var implantInfoArray = []
    
    var testArray = ["test", "test", "test", "test", "test"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loadingActivity = CozyLoadingActivity(text: "Loading...", sender: self, disableUI: true)
        
        //textView.editable = false
        //textView.contentInset = UIEdgeInsets(top: +60,left: 0,bottom: 0,right: 0)
        // Populate Text Area
        textLabel.text = "\(selectedFeedTitle)"
        self.tableView.rowHeight = 70
        self.tableView.dataSource = self
        self.tableView.delegate = self

        
        yesButton2.hidden = true
        noButton2.hidden = true
        moreLabel2.hidden = true
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

        
        
        switch selectedFeedTitle {
            
        case NSLocalizedString("Intrauterine Device", comment: ""):
            //feedImage.image = UIImage(named: "Hormone IUD")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "CuFarh1Mxi")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            

            selectedFeedFeedContent = NSLocalizedString("An IUD is a small, soft, flexible T-shaped device that is wrapped in copper or contains hormones. A health care provider puts it into your uterus. A thin plastic string tied to the end of the IUD hangs down through the cervix into the vagina. You can check that the IUD is in place by feeling for this string every month. Your sexual partner cannot feel the string during sex. The string is also used by your health care provider to remove the IUD. \n\nThere are two types of IUDs: the Copper IUD and the Hormonal IUD. \n\nThe Copper IUD goes by the brand name ParaGard®. It releases a small amount of copper into the uterus that makes the uterus and fallopian tubes produce a fluid that kills sperm. Killing the sperm prevents them from reaching and fertilizing the egg. If fertilization does occur, the IUD keeps the fertilized egg from attaching to the uterus and growing. It can stay in your uterus for up to 10 years, but it can be removed at any time. It is hormone free. It begins working as soon as it is inserted in your uterus and you can get pregnant as soon as it is removed. \n\nThe Hormonal IUD contains a form of the hormone progestin that is released into the uterus. There are 2 types of hormonal IUDs available, Mirena® and Skyla®. It is sometimes called an intrauterine system, or IUS. The progestin works in 3 ways: It thickens the cervical mucus, which keeps sperm from joining with the egg. It changes the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. It sometimes stops the ovaries from releasing eggs. The hormones in this type of IUD also reduce menstrual bleeding and cramping. An IUD can stay in your uterus for up to 5 years (Mirena® – 5 years; Sklya® – 3 years), but it can be removed at any time. \n\n<b>What can I expect when the IUD is inserted?</b> The insertion procedure only takes a few minutes and can be done in the health care provider’s office. During insertion, you might feel a temporary pinching or cramping. Light cramping and spotting may occur for 1-2 days after insertion. You may immediately return to your normal daily activities after insertion. Your period will begin again shortly after the IUD is removed. \n\n<b>Are there advantages in using an IUD?</b> An IUD is more than 99% effective in preventing pregnancy. It is the most cost-effective method of birth control over time. Having an IUD is hassle-free, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. An IUD is effective in preventing pregnancy for 3-10 years, depending on the type and brand of IUD. An IUD does not require interruption of sexual activity. Using an IUD does not require cooperation of sexual partner. Your partner will not feel it during sex. It is safe to use while breast-feeding. An IUD can be removed whenever you have problems or want to stop using it. Fertility returns with the first ovulation cycle following IUD removal. For the hormonal IUD, after your body has adjusted, your period may be shorter and lighter than before. It may remain irregular or it may stop completely. These effects will continue as long as you have the hormonal IUD in place. A hormonal IUD can relieve heavy menstrual bleeding and cramping in most women. \n\n<b>Are there disadvantages in using an IUD?</b> It may be costly, but the costs may be reduced or free at a community clinic or if you have health insurance. It also costs to have the IUD removed. However, if an IUD is used for 5 years or longer, it is the most cost-effective form of birth control. The implant does NOT protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). If you are not sure if your sex partner might have a STI, use a condom to protect against infection. You are screened for STIs before getting an IUD to prevent any infection from moving from your vagina into your uterus. For the copper IUD, you might have heavier, longer periods, and some spotting between periods for a few months. After about four months, your body adjusts to having the copper IUD in place. The hormonal IUD can cause hormonal side effects similar to those caused by any birth control method that contains estrogen such as breast tenderness, mood swings, headaches, and acne. This is rare. When side effects do happen, they usually go away after the first few months. \n\n<b>How do I get an IUD?</b> A health care provider inserts it into your uterus during an office visit. After it is inserted, you only need to do monthly string checks at home. To do a monthly string check, insert a finger into your vagina and feel for the cervix, which is at the top of the vagina and feels harder than the rest of your vagina (some women say it feels like the tip of your nose). You should be able to feel the thin, plastic string coming out of the opening of your cervix. It may coil around the cervix, which can make it difficult to find. If you cannot feel the string, it does not necessarily mean that the IUD has come out of the uterus. Use another form of birth control until your health care provider makes sure that the IUD is still in place. If you have no problems, check the string after each period and return to your doctor once a year for a checkup. \n\n<b>What is the possibility of getting pregnant while having an IUD?</b> Using an IUD is one of the most reliable methods of birth control. Out of 100 women who use this method, less than 1 woman gets pregnant. \n\n\n\n", comment: "IUD Description")
            
            
        case NSLocalizedString("Implant", comment: ""):
            //feedImage.image = UIImage(named: "Implant")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "XofnO83HD7")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("An implant, called Nexplanon® is a thin rod about the size of a matchstick that contains progestin. A health care provider places it underneath the skin in your arm. The implant releases the hormone slowly into your bloodstream. \n\nProgestin works in 3 ways: It thickens the cervical mucus, which keeps sperm from joining with the egg. It changes the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. It sometimes stops the ovaries from releasing eggs. \n\n<b>Are there advantages in using an implant?</b> It is very effective in preventing pregnancy for a long period of time – up to 3 years. Using an implant is hassle-free, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. It lasts for 3 years, but it may be removed earlier or, at the end of three years, have the implant removed and another implant inserted. It is safe to use while breastfeeding. The implant is estrogen-free. So you can use it if you do not want to take estrogen or cannot take estrogen because you have certain health problems or concerns. It may reduce heavy bleeding and cramping. It is convenient. It is always providing birth control and cannot be seen. You do not need to remember to take a pill or get a shot. You do not have to interrupt sexual activity to protect against pregnancy. \n\n<b>Are there disadvantages in using an implant?</b> The implant does NOT protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against infection. \n\nThe most common side effects are related to changes in your periods. It may cause irregular periods, or you may have spotting between periods. You may also stop getting a period. Some women see having no period as an advantage. \n\n<b>How do I get it?</b> A health care provider, usually a doctor or nurse practitioner, needs to put it under the skin of your upper arm near your elbow. The insertion only takes a few minutes and can be done in the health care provider’s office. To insert the implant, you will get a shot to numb the skin, and then the thin rod is placed just under the skin with a needle. To remove the implant later, your health care provider numbs the area, makes a small cut in the skin, and pulls the implant out. \n\n<b>What is the possibility of getting pregnant while having an implant?</b> Having an implant is a very reliable method of birth control. Out of 100 women who use this method, less than 1 may get pregnant. \n\n\n\n", comment: "Implant Description")
            
        case NSLocalizedString("Birth Control Shot", comment: ""):
            //feedImage.image = UIImage(named: "Shot")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "JD7kcDxMk7")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("The birth control shot (Depo Provera® or “Depo”) is a shot of the hormone progestin. \n\nProgestin works in 3 ways: It thickens the cervical mucus, which keeps sperm from joining with the egg. It changes the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. It sometimes stops the ovaries from releasing eggs. You get the shot in the muscle of your upper arm or hip. The first shot is given during the first five (5) days of a normal period. The shot provides birth control for 3 months at a time. You then need another shot. \n\n<b>Are there advantages in using the birth control shot?</b> The shot is one of the most effective methods of birth control. It is convenient. You need to get a shot only once every 3 months to prevent pregnancy. You do not have to interrupt sexual activity to protect against pregnancy. It prevents pregnancy for 3 months at a time. You do not have to worry about birth control for this time. It is safe to use while breast-feeding. The shot may reduce heavy bleeding and cramping. The shot does not contain estrogen. So you can use it if you do not want to take estrogen or cannot take estrogen because you have certain health problems or concerns. \n\n<b>Are there disadvantages in using the birth control shot?</b> The shot does NOT protect against sexually transmitted infections (STIs), including herpes or HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against disease. The shot may cause bone loss in some women. Using the birth control shot may cause you to lose calcium stored in your bones. The longer you use the birth control shot the more calcium you are likely to lose. To help maintain strong bones, eat or drink calcium rich foods every day or add a calcium supplement to your diet. Weight-bearing exercises, such as walking, jogging, weight lifting, or stair climbing can help make bones stronger if done on a regular basis. The shot may cause irregular periods, or you may have spotting between periods. You may also stop getting a period. Some women see having no period as an advantage. You must go to your health care provider every 3 months to get the shot. \n\nIf you want to get pregnant, it may take 9 to 10 months after you stop getting the shot. This is because the hormones in the shot have to leave your system, and your body has to readjust. \n\n<b>How do I get the shot?</b> The shot is prescribed by a health care provider and given by a nurse into muscle of your arm or hip every 10-13 weeks. \n\n<b>What is the possibility of getting pregnant while using the birth control shot?</b> It is one of the most reliable methods of birth control available if taken correctly. You must get the shot on time. When the shot is used exactly as directed, 1 woman out of 100 gets pregnant. When the shot is not used exactly as directed, fewer than 3 women out of 100 get pregnant. It is actually user failure rather than method failure which is responsible for most of these pregnancies. It is important, therefore, to follow all instructions for using getting the shot, and to use another reliable method of birth control if you are late getting your shot or you stop using the shot. \n\n<b>What do I do if I am late getting my shot?</b> When late for your shot, you MUST use an additional birth control method (such as condoms and a spermicide or abstain from intercourse) as a back up for 7 days after you get your shot. If you realize after intercourse that you are late for your shot, call us for emergency contraception. \n\n\n\n", comment: "Shot Description")
            
        case NSLocalizedString("Vaginal Ring", comment: ""):
            //feedImage.image = UIImage(named: "Ring")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "tiWwrCYWD2")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("The Vaginal Ring is a soft, flexible plastic ring that is about 2 inches around. It is also called NuvaRing®. You put into your vagina and it releases hormones (estrogen and progesterone) that are absorbed by the vaginal tissues into the blood stream. \n\nEstrogen and progesterone prevent pregnancy in 3 ways: They thicken the cervical mucus, which keeps sperm from joining with the egg. They change the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. They stop the ovaries from releasing eggs in most women. \n\nYou squeeze the ring between your thumb and index finger and insert it into your vagina yourself. You need to keep the ring in the vagina for 3 weeks, and then take it out for a week. During the week that it is out, your period will begin. You put the new ring in exactly one week after you removed the old one. \n\n<b>How do I get the ring?</b> Your health care provider prescribes the ring. \n\n<b>Are there advantages in using the ring?</b> The ring is more effective for preventing pregnancy than barrier methods of birth control, such as the condom. The ring is convenient. You insert it only 1 time a month. You do not have to interrupt sexual activity to protect against pregnancy. Your sexual partner cannot feel the ring when it is in place. \n\n<b>Are there disadvantages in using the ring?</b> The ring does NOT protect against sexually transmitted infections (STIs), such as herpes or HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against disease. The ring may cause changes in your period. You may have little bleeding, skipped periods, or spotting. The ring may cause changes in your period. You may have little bleeding, skipped periods, or spotting. \n\n<b>What is the possibility of getting pregnant while using the ring?</b> Using the ring can be a reliable method of birth control if used correctly. Out of 100 women who use this method, an average of 5 women get pregnant. In the first year of use: When the ring is used exactly as directed, less than 1 woman out of 100 gets pregnant. When the ring is not used exactly as directed, 8 or more women out of 100 get pregnant. It is actually user failure rather than method failure which is responsible for most of these pregnancies. It is important, therefore, to follow all instructions for using the ring, and to use another reliable method of birth control if you stop using the ring or it falls out and you do not replace it right away. \n\n<b>What do I do if the ring falls out?</b> If the ring falls out and stays out for more that 3 hours, you need to use another kind of birth control method until the ring has been used for 7 days in a row. \n\n\n\n", comment: "Ring Description")
            
        case NSLocalizedString("Patch", comment: ""):
            //feedImage.image = UIImage(named: "Patch")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "aCh7HqNofP")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("The Patch, called Ortho Evra Transdermal System® or Xulane® (generic), is used to prevent pregnancy. It looks like a clear bandage and is put on the skin of your belly, rear end (buttocks), upper arm, or upper body (but not on a breast). The patch slowly releases a dose of the hormones estrogen and progestin that are absorbed through the skin. \n\nEstrogen and progestin prevent pregnancy in 3 ways: They thicken the cervical mucus, which keeps sperm from joining with the egg. They change the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. They stop the ovaries from releasing eggs in most women. You put on a new patch and take off the old patch once a week for 3 weeks. During the fourth week, you go without a patch. During the week without the patch, you have your period. Your period may be very light. \n\n<b>How do I get it?</b> Your health care provider prescribes the patch. \n\n<b>Are there advantages in using the patch?</b> The patch is more effective for preventing pregnancy than barrier methods of birth control, such as the condom. It may reduce acne, heavy bleeding and cramping, and symptoms of premenstrual syndrome. It is convenient. You put it on only 3 times each month. You do not have to interrupt sexual activity to protect against pregnancy. It is easy to check to see if you forgot to put one on. \n\n<b>Are there disadvantages in using the patch?</b> The patch does NOT protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against infection. The patch may cause changes in your period. You may have little bleeding, skipped periods, or spotting. The patch may be less effective in women who are overweight. If you weigh more than 198 pounds, it may not absorb well and may not be right for you. You must remember to change the patch on schedule. \n\n<b>What is the possibility of getting pregnant while using the patch?</b> Using the patch can be a reliable method of birth control if used correctly. Out of 100 women who the patch, an average of 5 women gets pregnant. In the first year of use: When the patch is used exactly as directed, less than 1 woman out of 100 gets pregnant. When the patch is not used exactly as directed, 8 or more women out of 100 get pregnant. It is actually user failure rather than method failure which is responsible for most of these pregnancies. It is important, therefore, to follow all instructions for using the patch, and to use another reliable method of birth control if your patch falls off and you do not replace it right away or you forget to put on a new patch. \n\n\n\n", comment: "Patch Description")
            
        case NSLocalizedString("Pill", comment: ""):
            //feedImage.image = UIImage(named: "Pills")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "hGWG54Pk1i")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("Birth control pills, also known as oral contraceptives or combined hormonal contraceptives, contain two hormones, estrogen and progestin. \n\nEstrogen and progestin prevent pregnancy in 3 ways: They thicken the cervical mucus, which keeps sperm from joining with the egg. They change the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. They stop the ovaries from releasing eggs in most women. You should swallow the pill at the same time every day, whether or not you have sex. The pill is supplied in a pack. It is taken for 28 days, but the last 7 days contain an iron pill or a sugar pill before beginning a new pack of pills. During the iron pill or sugar pill week, your period will begin. \n\n<b>Are there advantages to taking birth control pills?</b> Birth control pills work better than barrier methods. Barrier methods include condoms. Using the pill makes your periods regular and predictable. Using the pill makes your periods shorter with less flow and less cramping. Using the pill may reduce the symptoms of PMS. The pills let you control your periods. You can have periods every month or every few months. Or you can choose not to have them at all. You do not have to interrupt sexual activity to use the pills. Using the pill can improve acne. Using the pill has been shown to help protect against the following serious health problems: cancer of the ovaries and the lining of the uterus, pelvic inflammatory disease (PID) benign (non-cancerous) breast tumors and cysts, ovarian cysts, endometriosis (a potential cause of infertility), and anemia. \n\n<b>Are there disadvantages to taking birth control pills?</b> You have to take a pill at the same time every day to prevent pregnancy. The pill does NOT protect against sexually transmitted infections (STIs), such as herpes or HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against disease. \n\n<b>Because the pill contains estrogen and progestin, the pill sometimes produces the following side effects:</b> spotting or bleeding between periods, missed periods, nausea, depression or irritability, breast tenderness, headaches, weight gain or loss, changes in sex drive, acne (usually improves but could worsen) it should be noted that pill side effects often improve once a woman has been on the pill a couple of months, or can be lessened or eliminated by changing pill brands. It is not common, but some women who take the pill develop high blood pressure. It is rare, but some women will have blood clots, heart attacks, or strokes. Strokes are most likely to occur in smokers over the age of 35 years, so the pill will not be prescribed in to women who smoke and are over 35 years of age. \n\n<b>What is the possibility of getting pregnant while using the pill?</b> Using the pill can be a reliable method of birth control if used correctly. Out of 100 women who use this method, an average of 5 women get pregnant. In the first year of use: When combination pills are taken exactly as directed, less than 1 woman out of 100 gets pregnant. When pills are not taken exactly as directed, such as forgetting to take them sometimes, 8 or more women out of 100 get pregnant. It is actually user failure rather than method failure which is responsible for most of these pregnancies. It is important, therefore, to follow all instructions for using the pill, and to use another reliable method of birth control if you stop taking the pills or forget to take your pills. \n\n\n\n", comment: "Pills Description")
            
        case NSLocalizedString("Mini-Pill", comment: ""):
            //feedImage.image = UIImage(named: "Pills")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "hGWG54Pk1i")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("Mini-pills contain the hormone called progestin. They are different from regular combination birth control pills because they only contain one hormone. Progestin works in 3 ways: It thickens the cervical mucus, which keeps sperm from joining with the egg. It changes the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. It sometimes stops the ovaries from releasing eggs. Mini-pills come in packs. There are no spacer pills for a week as the combination birth control pills have. You have to take a pill every day at the same time to prevent pregnancy. This means you take a pill even when you have your period. \n\n<b>Are there advantages in taking mini-pills?</b> Mini-pills work better than barrier methods such as condoms. Mini-pills may cause fewer side effects than combination birth control pills. They may reduce heavy bleeding and cramping. They do not contain estrogen. So you can use them if you do not want to take estrogen or if you have health problems where estrogen should not be taken. They are safe to use while breast-feeding. You do not have to interrupt sex to use them. \n\n<b>Are there disadvantages in taking mini-pills?</b> Mini-pills do NOT protect against sexually transmitted infections (STIs), such as herpes or HIV (the virus that causes AIDS). If you are not sure if your sexual partner might have an STI, use a condom to protect against disease. They may cause irregular periods. You may have spotting between periods. You may also stop getting a period. Some women see having no period as an advantage. You must take a pill at the same time every day to prevent pregnancy. \n\n<b>What is the possibility of getting pregnant while using the mini-pill?</b> Using the mini-pill can be a reliable method of birth control if used correctly. Out of 100 women who use this method, about 5 get pregnant. In the first year of use: When mini-pills are taken exactly as directed, less than 1 woman out of 100 gets pregnant. When pills are not taken exactly as directed, such as forgetting to take them sometimes, 8 or more women out of 100 get pregnant. It is actually user failure rather than method failure which is responsible for most of these pregnancies. It is important, therefore, to follow all instructions for using the mini-pill, and to use another reliable method of birth control if you stop taking the mini-pills or forget to take the mini-pills. \n\n\n\n", comment: "Mini-Pill Description")
            
        case NSLocalizedString("Condom – Male and Female", comment: ""):
            //feedImage.image = UIImage(named: "Condom")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "KqcrOgWbDg")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in

                if error == nil {
            
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("<b>Male condom:</b> \n\nWorn by the man, a male condom keeps sperm from getting into a woman’s body. Latex condoms, the most common type, help prevent pregnancy, and HIV and other STDs, as do the newer synthetic condoms. “Natural” or “lambskin” condoms also help prevent pregnancy, but may not provide protection against STDs, including HIV. \n\nCondoms can only be used once. You can buy condoms, KY jelly, or water-based lubricants at a drug store. Do not use oil-based lubricants such as massage oils, baby oil, lotions, or petroleum jelly with latex condoms. They will weaken the condom, causing it to tear or break. \n\n<b>Female condom:</b>\n\nWorn by the woman, the female condom helps keeps sperm from getting into her body. It is packaged with a lubricant and is available at drug stores. It can be inserted up to eight hours before sexual intercourse. \n\n<b>Which barrier methods protect me from sexually transmitted infections (STIs)?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). To help protect yourself and your partner from getting or spreading a STI, be sure to use a condom every time you have sex. \n\n<b>How do I get a barrier method?</b> Male condoms, female condoms, sponge with a spermicide, and all the different types of spermicides can be bought over-the-counter. \n\n<b>Are there advantages in using barrier methods?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS) or when you do not know that you are both infection-free. Barrier methods do not affect a woman or man's future fertility. Barrier methods are a good choice if you are planning to become pregnant soon and prefer a method you can stop using anytime you want. Barrier methods are only used at the time of sexual intercourse. Barrier methods are a good choice if you want an option that does not require hormones or insertion of an implant or IUD. Barrier methods do not affect other health conditions such as high blood pressure. Barrier methods are less expensive than some of the other methods of birth control, and some you can get without a prescription. Barrier methods are a good choice if you are breast-feeding. \n\n<b>Are there disadvantages in using barrier methods?</b> Couples who use barrier methods have the highest pregnancy rates than if they used any other type of birth control. It must be used EVERY time you have intercourse. Some couples find barrier methods embarrassing to use or they do not want a barrier method to interrupt foreplay or intercourse. The man or the woman may develop allergies to spermicides. Some of the barrier methods such as the diaphragm or cervical cap require spermicides. \n\n<b>What is the possibility of getting pregnant while using Male or Female Condoms?</b> In the first year of use: When male condoms are used exactly as directed, between 11 and 16 women out of 100 became pregnant, and when female condoms are used exactly as directed, 20 women out of 100 became pregnant. \n\n\n\n", comment: "Condom Male-Female Description")
            
        case NSLocalizedString("Spermicide", comment: ""):
            //feedImage.image = UIImage(named: "Foam")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "Zbv03ozKwt")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("<b>Spermicides:</b> \n\nThese products work by killing sperm and come in several forms—foam, gel, cream, film, suppository, or tablet. They are placed in the vagina no more than one hour before intercourse. You leave them in place at least six to eight hours after intercourse. You can use a spermicide in addition to a male condom, diaphragm, or cervical cap. They can be purchased at drug stores. \n\n<b>Which barrier methods protect me from sexually transmitted infections (STIs)?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). To help protect yourself and your partner from getting or spreading a STI, be sure to use a condom every time you have sex. \n\n<b>How do I get a barrier method?</b> Male condoms, female condoms, sponge with a spermicide, and all the different types of spermicides can be bought over-the-counter. \n\n<b>Are there advantages in using barrier methods?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS) or when you do not know that you are both infection-free. Barrier methods do not affect a woman or man's future fertility. Barrier methods are a good choice if you are planning to become pregnant soon and prefer a method you can stop using anytime you want. Barrier methods are only used at the time of sexual intercourse. Barrier methods are a good choice if you want an option that does not require hormones or insertion of an implant or IUD. Barrier methods do not affect other health conditions such as high blood pressure. Barrier methods are less expensive than some of the other methods of birth control, and some you can get without a prescription. Barrier methods are a good choice if you are breast-feeding. \n\n<b>Are there disadvantages in using barrier methods?</b> Couples who use barrier methods have the highest pregnancy rates than if they used any other type of birth control. It must be used EVERY time you have intercourse. Some couples find barrier methods embarrassing to use or they do not want a barrier method to interrupt foreplay or intercourse. The man or the woman may develop allergies to spermicides. Some of the barrier methods such as the diaphragm or cervical cap require spermicides. \n\n<b>What is the possibility of getting pregnant while using Spermicides?</b> In the first year of use: When spermicides are used exactly as directed, 30 women out of 100 gets pregnant. \n\n\n\n", comment: "Spermicide Description")
            
        case NSLocalizedString("Sponge with Spermicide", comment: ""):
            //feedImage.image = UIImage(named: "Sponge")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "Nc3jiPHfKe")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("<b>Sponge with spermicide:</b> \n\nThis is a disk-shaped plastic device with spermicide in it. It is put in the vagina before sex. It protects for up to 24 hours if left in place. You must leave the sponge in place for at least 6 hours after sex. It must be removed within 30 hours after it is put in place. \n\n<b>Which barrier methods protect me from sexually transmitted infections (STIs)?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). To help protect yourself and your partner from getting or spreading a STI, be sure to use a condom every time you have sex. \n\n<b>How do I get a barrier method?</b> Male condoms, female condoms, sponge with a spermicide, and all the different types of spermicides can be bought over-the-counter. \n\n<b>Are there advantages in using barrier methods?</b> Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS) or when you do not know that you are both infection-free. Barrier methods do not affect a woman or man's future fertility. Barrier methods are a good choice if you are planning to become pregnant soon and prefer a method you can stop using anytime you want. Barrier methods are only used at the time of sexual intercourse. Barrier methods are a good choice if you want an option that does not require hormones or insertion of an implant or IUD. Barrier methods do not affect other health conditions such as high blood pressure. Barrier methods are less expensive than some of the other methods of birth control, and some you can get without a prescription. Barrier methods are a good choice if you are breast-feeding. \n\n<b>Are there disadvantages in using barrier methods?</b> Couples who use barrier methods have the highest pregnancy rates than if they used any other type of birth control. It must be used EVERY time you have intercourse. Some couples find barrier methods embarrassing to use or they do not want a barrier method to interrupt foreplay or intercourse. The man or the woman may develop allergies to spermicides. Some of the barrier methods such as the diaphragm or cervical cap require spermicides. \n\n<b>What is the possibility of getting pregnant while using Sponge with Spermicide?</b> In the first year of use: When the sponge with spermicide is used exactly as directed, between 16 and 32 women out of 100 became pregnant. \n\n\n\n", comment: "Sponge With Spermicide Description")
            
        case NSLocalizedString("Emergency Contraception", comment: ""):
            //feedImage.image = UIImage(named: "Plan B")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "YJGNCnRX4S")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            selectedFeedFeedContent = NSLocalizedString("<b>What is emergency birth control?</b> Emergency birth control is what you use after you have had unprotected sex - if you did not use birth control or your regular birth control failed (for example, if you forgot to take the pill or a condom broke). The most common emergency birth control is available as a pill, sometimes called “morning-after pills.” The pills must be taken within 5 days of having unprotected sex but it works better when taken sooner – within 72 hours is best. \n\nThese pills contain progestin. Progestin works in 3 ways: It thickens the cervical mucus, which keeps sperm from joining with the egg. It changes the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. It sometimes stops the ovaries from releasing eggs. \n\n<b>How do I get the emergency birth control?</b> One type of progestin-only pill (Plan B One- Step®) is available at a pharmacy without a prescription to anyone of any age. Another type of progestin-only pill (Next Choice One Dose®) is available behind the pharmacy counter without a prescription to anyone 17 years or older if you show proof of age and by prescription if you are younger than 17 years old. The pills come in 1-pill or 2-pill packages. Follow the directions in the package. If you do use emergency birth control, be sure to follow up with your health care provider to find an effective, ongoing method of birth control for you. Emergency birth control does not protect you for the rest of your cycle. Regular use of this method is not as reliable as other hormonal methods. \n\n<b>Are there advantages in using emergency birth control?</b> It is safe and effective in reducing the risk of pregnancy after unprotected sex. It is available at a pharmacy, without a prescription if you are older than 17 or from your healthcare provider at any age. It does not require consent from your sexual partner. \n\n<b>Are there disadvantages in using emergency birth control?</b> It only works if taken within 5 days of unprotected sex, but works best if used within 72 hours – but even sooner is better. Emergency contraception does NOT protect against sexually transmitted infections (STIs), such as herpes or HIV (the virus that causes AIDS). Emergency contraception may cause spotting or irregular/delayed periods. It may also cause nausea and headache. If a woman is already pregnant, emergency birth control will not work. \n\n<b>What is the possibility of getting pregnant while using emergency birth control?</b> Emergency contraception works well. The sooner you use it after unprotected sex or birth control failure, the more likely it is to prevent pregnancy.  Plan B® can prevent about 89% of pregnancies if taken within 3 days of unprotected sex. If you haven't started your period within 2-3 weeks after using emergency contraception, get a pregnancy test. You can start your hormonal birth control the same day as this method. \n\n\n\n", comment: "Emergency Birth Control Description")
            
        case NSLocalizedString("Long-Acting Reversible Contraceptives (LARC)", comment: ""):
            //feedImage.image = UIImage(named: "Copper IUD")
            
            var query = PFQuery(className: "imageFiles")
            query.whereKey("objectId", equalTo: "LmFpfcmQzu")
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    
                    for object : PFObject in objects as! [PFObject] {
                        let image = object["image"] as! PFFile
                        
                        image.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                loadingActivity.hideLoadingActivity(success: true, animated: true)
                                let finalimage = UIImage(data: imageData!)
                                self.feedImage.image = finalimage
                                
                                
                            }
                        }
                    }
                }
            }
            textLabel.font = UIFont(name: textLabel.font.fontName, size: 25)
            
            selectedFeedFeedContent = NSLocalizedString("Long-acting reversible contraceptives (LARC) or long-acting reversible birth control are methods of birth control that provide prevent pregnancy for a long period of time - up to 10 years for some methods! LARC include implants and intrauterine devices (IUD). \n\n<b>What are the advantages of using LARCs?</b> The advantages of using LARCs is that they are safe, reliable. and reversible. Using LARCs is better at preventing pregnancy because you would use the birth control method consistently and correctly without having to think about it. It does not require taking a pill every day or doing something every time before having sex. Most important, almost all women can use implants and IUDs even teenagers. \n\n\n\n", comment: "LARC Description")
            
            
//            createYesButton()
//            createNoButton()
//            createLARCLabel()
            moreLabel2.text = NSLocalizedString("Would you like to see what forms of birth control will work for you, including LARCs?", comment: "LARC More Info Label")
            
            yesButton2.hidden = false
            noButton2.hidden = false
            moreLabel2.hidden = false

            
            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
            
            

            
            
        default:
            feedImage.image = nil
            
            
            
        }
        
        //textView.text = "\(selectedFeedFeedContent)"
        //textView.attributedText = attributedText()
        
        
        
        func fixText(inputText:NSMutableAttributedString, attributeName:AnyObject, attributeValue:AnyObject, propsIndicator:String, propsEndIndicator:String)->NSMutableAttributedString{
            var r1 = (inputText.string as NSString).rangeOfString(propsIndicator)
            while r1.location != NSNotFound {
                let r2 = (inputText.string as NSString).rangeOfString(propsEndIndicator)
                if r2.location != NSNotFound  && r2.location > r1.location {
                    let r3 = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length)
                    inputText.addAttribute(attributeName as! String, value: attributeValue, range: r3)
                    inputText.replaceCharactersInRange(r2, withString: "")
                    inputText.replaceCharactersInRange(r1, withString: "")
                } else {
                    break
                }
                r1 = (inputText.string as NSString).rangeOfString(propsIndicator)
            }
            return inputText
        }
        
        
        //method for string conversation
//        func convertText(inputText: String) -> NSAttributedString {
//            
//            var attrString = NSMutableAttributedString(string: inputText)
//            let boldFont = UIFont.systemFontOfSize(20)
//            let boldBigFont = UIFont(name: "Helvetica-Bold", size: 14)
//            
//            attrString = fixText(attrString, NSFontAttributeName, boldFont, "<b>", "</b>")
//            attrString = fixText(attrString, NSFontAttributeName, boldBigFont!, "<a>", "</a>")
//            attrString = fixText(attrString, NSUnderlineStyleAttributeName, NSUnderlineStyle.StyleDouble.rawValue, "<u>", "</u>")
//            
//            return attrString
//        }
        
        func convertText(inputText: String) -> NSAttributedString {
            
            let attrString = NSMutableAttributedString(string: inputText)
            attrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location:0,length:attrString.length))
            let normalFont = UIFont(name: "Helvetica", size: 20.0)
            attrString.addAttribute(NSFontAttributeName, value: normalFont!, range: NSRange(location:0,length:attrString.length))
            let boldFont = UIFont(name: "Helvetica-Bold", size: 20.0)!
            
            var r1 = (attrString.string as NSString).rangeOfString("<b>")
            while r1.location != NSNotFound {
                let r2 = (attrString.string as NSString).rangeOfString("</b>")
                if r2.location != NSNotFound  && r2.location > r1.location {
                    let r3 = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length)
                    attrString.addAttribute(NSFontAttributeName, value: boldFont, range: r3)
                    attrString.replaceCharactersInRange(r2, withString: "")
                    attrString.replaceCharactersInRange(r1, withString: "")
                } else {
                    break
                }
                r1 = (attrString.string as NSString).rangeOfString("<b>")
            }
            
            return attrString
        }
        //textView.attributedText = convertText(selectedFeedFeedContent)
        
        
    }

//    func attributedText()->NSAttributedString{
//        
//        let string = selectedFeedFeedContent as NSString
//        
//        var attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(22)])
//        
//        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15.0)]
//        
//        // Part of string to be bold
//        attributedString.addAttributes(boldFontAttribute, range: string.rangeOfString("birth control"))
//        attributedString.addAttributes(boldFontAttribute, range: string.rangeOfString("some methods!"))
//        
//        // 4
//        return attributedString
//    }
    
    
    
    func createYesButton () {
        let yesButton = UIButton()
        yesButton.setTitle(NSLocalizedString("Yes", comment: "LARC More Info YES Button"), forState: .Normal)
        yesButton.titleLabel?.font = UIFont(name: "", size: 26)
        yesButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        yesButton.backgroundColor = UIColor(red: 0/255.0, green: 204/255.0, blue: 51/255.0, alpha: 1.0)
        yesButton.frame = CGRectMake(self.scrollView.contentSize.width, self.scrollView.contentSize.height, 160, 80)
        yesButton.addTarget(self, action: "yesPressed:", forControlEvents: .TouchUpInside)
        self.scrollView.addSubview(yesButton)
        
    }
    
    func createNoButton () {
        let noButton = UIButton()
        noButton.setTitle(NSLocalizedString("No", comment: "LARC More Info NO Button"), forState: .Normal)
        noButton.titleLabel?.font = UIFont(name: "", size: 26)
        noButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        noButton.backgroundColor = UIColor(red: 251/255.0, green: 6/255.0, blue: 6/255.0, alpha: 1.0)
        noButton.frame = CGRectMake(self.scrollView.contentSize.width, self.scrollView.contentSize.height, 160, 80)
        noButton.addTarget(self, action: "noPressed:", forControlEvents: .TouchUpInside)
        self.scrollView.addSubview(noButton)
 
    }
    
    func createLARCLabel () {
        
        let label = UILabel()
        label.text = NSLocalizedString("Would you like to see what forms of birth control will work for you, including LARCs?", comment: "LARC More Info Label")
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.frame = CGRectMake(0, 735, self.view.frame.width, 90)
        self.view.addSubview(label)
        
        
        
        
    }
    
    func yesPressed(sender: UIButton!) {
        let yesController = self.storyboard!.instantiateViewControllerWithIdentifier("YesController") as! QuestionViewController
        
        self.navigationController!.pushViewController(yesController, animated: true)
        
    }
    
    func noPressed(sender: UIButton!) {
        
        let quitAlert: UIAlertView = UIAlertView()
        
        quitAlert.delegate = self
        
        quitAlert.title = NSLocalizedString("If you're finished viewing this information, tap Okay to exit this page.", comment: "LARC Exit Popup")
        quitAlert.message = ""
        quitAlert.addButtonWithTitle(NSLocalizedString("Cancel", comment: "LARC Exit Popup"))
        quitAlert.addButtonWithTitle(NSLocalizedString("Okay", comment: "LARC Exit Popup"))
        
        quitAlert.show()
        
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
            
        case 1:
            self.restart()
            NSLog("sent")
            
        default:
            print("alertView \(buttonIndex) clicked")
            
            
        }
        
        
    }
    
    func restart() {
        
        let mainController = self.storyboard!.instantiateViewControllerWithIdentifier("Main") as! ViewController
        
        self.navigationController!.pushViewController(mainController, animated: true)
        
    }
    
    @IBAction func yesTwoPressed(sender: AnyObject) {
        
        yesPressed(sender as! UIButton)
    }
    
    @IBAction func noTwoPressed(sender: AnyObject) {
        
        noPressed(sender as! UIButton)
    }

    

    var selectedIndexPath : NSIndexPath?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! TableViewCell
        let row = indexPath.row
        
        switch selectedFeedTitle {
            
            case NSLocalizedString("Intrauterine Device", comment: ""):
            cell.titleLabel.text = IUDQuestionsArray[row] as String
            cell.infoView.text = IUDInfoArray[row] as String
            
            case NSLocalizedString("Implant", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Birth Control Shot", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Vaginal Ring", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Patch", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Pill", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Mini-Pill", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Condom – Male and Female", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Spermicide", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Sponge with Spermicide", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Emergency Contraception", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            case NSLocalizedString("Long-Acting Reversible Contraceptives (LARC)", comment: ""):
            cell.titleLabel.text = testArray[row] as String
            
            default:
            cell.titleLabel.text = "NIL"
        }
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }
            
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.titleLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            
        }
        
        cell.titleLabel?.textColor = UIColor.whiteColor()
        cell.infoView.font = UIFont(name: "Helvetica Neue", size: 18)
        cell.infoView.textColor = UIColor.whiteColor()
        cell.infoView.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableViewCell).watchFrameChanges()
        
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableViewCell).ignoreFrameChanges()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        for cell in tableView.visibleCells as! [TableViewCell] {
            cell.ignoreFrameChanges()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return TableViewCell.expandedHeight
        } else {
            return TableViewCell.defaultHeight
        }
    }

}
