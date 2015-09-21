//
//  HSViewController.swift
//  Contraception App
//
//  Created by Dominic Vitucci on 7/7/15.
//  Copyright (c) 2015 Dominic Vitucci. All rights reserved.
//

import UIKit

class HSViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "Top Bar"))
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 320, 44))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "Top Bar")
        
        self.navigationItem.titleView = titleView

//        textView.textColor = UIColor.whiteColor()
//        textView.font = UIFont(name: "System", size: 20)
        
        textView.text = NSLocalizedString("Thinking about having sex? You may feel curious, interested or even pressured. How do you know what is right for you? Here are some things to consider: \n\n What is your knowledge of sexual issues, HIV, other STDs, and pregnancy (including methods of prevention)? \n\n Are you confident with your individual ability to avoid HIV/STD risk and risk behaviors? What do you know about condoms and other birth control methods? Are you comfortable that you’ll be able to refuse sex or use condoms? \n\n What are your personal values about sex and abstinence? \n\n Are you comfortable communicating with parents or other adults about sex, condoms, and contraception? (http://www.cdc.gov/teenpregnancy/about/index.htm) \n\n Good decision-making is what becoming an adult is all about, so it is important to educate yourself and decide what’s important to you. It is no secret that sex can be fun, and it is also important to realize that there are certain risks associated with it. The only way to completely avoid these risks is to not engage in any type of sexual activity (abstinence). However, if you do choose to have sex, the best thing you can do is understand these risks, and how to avoid them, to protect your body and your future. You have a long time in your body, so take care of you and it. \n\n So what are these risks? Here are some quick facts about the main risks involving sex; pregnancy and sexually transmitted infections. In America, 3 out of every 10 teen girls (or 750,000 per year) will get pregnant at least once before they turn 20. Teens who do not use a birth control method have a 90% chance of becoming pregnant. Of the teens who become pregnant, more than 50% will never graduate high school and less than 2% will earn a college degree before they turn 30. 80% of teen dads will not marry the mother of their child. 2/3 of teen mothers will live in poverty and over half become dependent on welfare. The United States has the highest teen pregnancy rate of any other industrialized nation. \n\nThe good news is in the last couple of years teen pregnancy rates have fallen dramatically thanks to teens being better educated about sex. (https://www.dosomething.org/facts/11-facts-about-teen-pregnancy). \n\n 1 out of every 4 sexually active teens becomes infected with an STD every year. Many teens do not realize that these infections can be spread through oral sex as well as intercourse, which raises the risk. Condoms are the only birth control method that protects against STDs. So it’s best to use condoms in conjunction with other birth control methods to better protect yourself. \n\n How do I lower the risks? There are many different types of birth control available. Find one that works for you! The best birth control methods for teenagers are those that are easy for you to use (or are already in effect) each time you have intercourse. The easiest and most reliable methods for birth control are a birth control implant or intrauterine device (IUD). They are recommended for teenagers and are reversible. When you finally do want to become pregnant, you just have them removed by a health care provider. Having an implant or IUD is hassle-free, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. An implant or IUD is effective in preventing pregnancy for 3-10 years, depending on which type you choose. Using the pill, patch, or ring can be reliable methods of birth control if used correctly. It is actually user failure rather than method failure which is responsible for most of the pregnancies that happen while using these methods. It is important, therefore, to follow all instructions for using the method you have chosen. Condoms are the only birth control method that protects against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). Using a condom as birth control is not a reliable method for preventing pregnancy. \n\n What else can I do? Educate yourself on how your body works. Male sperm can live in the female body for up to 5 days after sexual intercourse. Generally women can only become pregnant during ovulation, which usually occurs 14 days after the start of each period. But it’s possible for some women to ovulate more than once per month, or have cycles that don’t follow the 14 day rule. This makes it possible for some women to become pregnant while on their period. Many people believe different sexual positions can prevent pregnancy. But the truth is women can become pregnant in any position. Know yourself. Feelings of sexual desire are normal and can be intense and exciting, which sometimes makes it hard to stay safe. Don’t give in to something that makes you uncomfortable. Avoid situations where you feel pressured to have sex. Find an adult you’re comfortable with that can honestly answer questions you have about sex. This person may be a parent or other family member, or even someone like a counselor, doctor, or nurse. Choose sexual partners who care about and respect your health and boundaries. \n\n\n\n", comment: "")
        
        textView.textColor = UIColor.whiteColor()
        textView.font = UIFont.systemFontOfSize(20)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
