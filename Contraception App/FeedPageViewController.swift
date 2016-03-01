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
    
    var IUDInfoArray: [String] = []
    
    var implantQuestionsArray = [NSLocalizedString("What is it?", comment: ""), NSLocalizedString("Are there advantages in using an implant?", comment: ""), NSLocalizedString("Are there disadvantages in using an implant?", comment: ""), NSLocalizedString("How do I get it?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while having an implant?", comment: "")]
    
    var implantInfoArray = [NSLocalizedString("\u{2022} An implant, called Nexplanon® is a thin rod about the size of a match that has a hormone called progestin in it. A health care provider puts it below the skin in your arm near your elbow. \n\n\u{2022} The implant lets go of the hormone slowly into your blood. \n\n\u{2022} Progestin works in 3 ways: \n\n\u{2022} It thickens the mucus of your cervix (the lower end of your uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} It changes the lining of your uterus so nothing can attach to the uterus and grow. \n\n\u{2022} It may stop the ovaries from letting eggs go so they cannot meet a sperm.", comment: ""), NSLocalizedString("\u{2022}It is very good in preventing pregnancy for a long time – up to 3 years. \n\n\u{2022} Using an implant is easy, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using the implant unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} It lasts for 3 years, but it may be taken out sooner. At the end of three years, the implant can be taken out and another implant put in or other methods used. \n\n\u{2022} It is safe to use if you are breastfeeding. \n\n\u{2022} The implant does not have the hormone estrogen in it. So you can use it if you do not want to take estrogen or cannot take estrogen because you have certain health problems or concerns. \n\n\u{2022} It may reduce bleeding and cramping with your periods. \n\n\u{2022} It always provides birth control and cannot be seen. You do not need to remember to take a pill or get a shot.", comment: ""), NSLocalizedString("\u{2022}The implant does NOT protect against STDs, including HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, use a condom to protect against infection. \n\n\u{2022} The implant may cause changes in your period. Your periods may not be regular, or you may have spotting between periods. You may also stop getting a period.", comment: ""), NSLocalizedString("\u{2022} A health care provider, usually a doctor or nurse practitioner, needs to put it under the skin of your upper arm near your elbow. \n\n\u{2022} Putting the implant in only takes a few minutes and can be done in the health care provider’s office. \n\n\u{2022} While the implant is being put in, you will get a shot to numb the skin, and then the thin rod is put just under the skin with a needle. \n\n\u{2022} To take out the implant later, your health care provider numbs the area, makes a small cut in the skin, and pulls the implant out.", comment: ""), NSLocalizedString("\u{2022} An implant is a very good method of birth control. \n\n\u{2022} Out of 100 women who use this method, less than 1 may get pregnant.", comment: "")]
    
    var shotQuestionArray = [NSLocalizedString("What is the birth control shot? ", comment: ""), NSLocalizedString("Are there advantages in using the birth control shot?", comment: ""), NSLocalizedString("Are there disadvantages in using the birth control shot?", comment: ""), NSLocalizedString("How do I get the shot?", comment: ""), "", NSLocalizedString("What is the possibility of getting pregnant while using the birth control shot?", comment: ""), NSLocalizedString("What do I do if I am late getting my shot?", comment: "")]
    
    var shotInfoArray = [NSLocalizedString("\u{2022} The birth control shot (Depo Provera® or “Depo”) is a shot of the hormone progestin. \n\n\u{2022} Progestin works in 3 ways: \n\n\u{2022} It thickens the mucus of the cervix (the lower part of your uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} It changes the lining of your uterus so nothing can attach to the uterus. \n\n\u{2022} It may stop the ovaries from letting eggs go so they cannot meet a sperm. \n\n\u{2022} You get the shot in the muscle of your upper arm or hip. \n\n\u{2022} The first shot is given during the first five (5) days of a normal period the first time. \n\n\u{2022} The shot provides birth control for 3 months at a time. You then need another shot.", comment: ""), NSLocalizedString("\u{2022} The shot is a very good method of birth control. It is simple. You need to get a shot only once every 3 months to prevent pregnancy. You do not have to take a daily pill or change a patch weekly or change a ring monthly. \n\n\u{2022} It prevents pregnancy for 3 months at a time. You do not have to worry about birth control for this time. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using the shot unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} It is safe to use while breastfeeding. \n\n\u{2022} The shot may reduce bleeding and cramping during your periods. \n\n\u{2022} The shot does not have estrogen in it. You can use it if you do not want to take estrogen or cannot take estrogen because you have certain health problems or concerns.", comment: ""), NSLocalizedString("\u{2022} The shot does NOT protect against STDs, including HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, use a condom to protect against disease. \n\n\u{2022} The shot may cause bone loss over time in some women. Using the birth control shot may cause you to lose calcium stored in your bones. The longer you use the birth control shot the more calcium you are likely to lose. \n\n\u{2022} To help build strong bones, eat or drink calcium rich foods every day or add a calcium pill to your diet. Exercises, such as walking, jogging, lifting, or stair climbing can help make bones stronger if done on a regular basis. \n\n\u{2022} The shot may reduce bleeding and cramping with your periods. Your period may not be regular or it may stop completely. These effects will continue as long as you are getting the shots. \n\n\u{2022} You must go to your health care provider every 3 months to get the shot. \n\n\u{2022} If you want to get pregnant, it may take 9 to 10 months after you stop getting the shot. This is because the hormones in the shot have to have time to leave your body.", comment: ""), NSLocalizedString("\u{2022} The shot is prescribed by a healthcare provider and given by a nurse into muscle of your arm or hip every 3 months or about every 10-13 weeks.", comment: ""), NSLocalizedString("\u{2022} It is one of the best methods of birth control available if taken correctly. \n\n\u{2022} You must get the shot on time. \n\n\u{2022} When the shot is taken on time, 1 woman out of 100 gets pregnant. \n\n\u{2022} When the shot is not taken on time, fewer than 3 women out of 100 get pregnant. \n\n\u{2022} It is important to follow all instructions for getting the shot, and to use another method of birth control if you are late getting your shot or you stop using the shot.", comment: ""), NSLocalizedString("\u{2022} When late for your shot, you MUST use another birth control method (such as condoms and a spermicide or do not have sex) until you get your shot and as a back up for 7 days after you get your shot. \n\n\u{2022} If you realize after sex that you are late for your shot, call us for emergency contraception (Plan B).", comment: "")]
    
    var ringQuestionArray = [NSLocalizedString("What is the ring? ", comment: ""), NSLocalizedString("How do I get the ring?", comment: ""), NSLocalizedString("Are there advantages in using the ring?", comment: ""), NSLocalizedString("Are there disadvantages in using the ring?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using the ring?", comment: ""), NSLocalizedString("What do I do if the ring falls out?", comment: "")]
    
    var ringInfoArray = [NSLocalizedString("\u{2022} It is a soft plastic ring that is about 2 inches around. It is also called NuvaRing®. \n\n\u{2022} You put into your vagina and it slowly lets go of the hormones, estrogen and progestin. The hormones are absorbed into the blood through the vagina. \n\n\u{2022} Estrogen and progestin prevent pregnancy in 3 ways: \n\n\u{2022} They thicken the mucus of the cervix (the lower end of the uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} They change the lining of your uterus so nothing can attach to the uterus and grow. \n\n\u{2022} They stop the ovaries from letting eggs go so they cannot meet the sperm. \n\n\u{2022} You squeeze the ring between your thumb and index finger and insert it into your vagina yourself. You need to keep the ring in the vagina for 3 weeks, and then take it out for a week. During the week that it is out, your period will begin. You put the new ring in exactly one week after you took out the old one.", comment: ""), NSLocalizedString("\u{2022} Your healthcare provider prescribes the ring.", comment: ""), NSLocalizedString("\u{2022} The ring is better at preventing pregnancy than barrier methods of birth control, such as the condom alone. \n\n\u{2022} The ring is easy. You insert it only 1 time a month. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using the ring unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} Your sex partner cannot feel the ring when it is in place.", comment: ""), NSLocalizedString("\u{2022} The ring does NOT protect against STDs, such as HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, use a condom to protect yourself against diseases. \n\n\u{2022} You may have spotting between periods at first. Your periods may be lighter and shorter. You may have less cramps. \n\n\u{2022} You must remember to remove the old ring and insert a new ring at the right time each month.", comment: ""), NSLocalizedString("\u{2022} Using the ring can be a good method of birth control if used correctly. \n\n\u{2022} Out of 100 women who use this method, about 5 women get pregnant. \n\n\u{2022} In the first year of use: \n\n\u{2022} When the ring is used exactly as directed, less than 1 woman out of 100 gets pregnant. \n\n\u{2022} When the ring is not used exactly as directed, 8 or more women out of 100 get pregnant. \n\n\u{2022} It is important to follow all instructions for using the ring, and to use another method of birth control if you stop using the ring or it you do not replace it right away.", comment: ""), NSLocalizedString("\u{2022} It rarely happens. But, if the ring falls out and stays out for more than 3 hours, you need to use another kind of birth control until the ring has been used for 7 days in a row.", comment: "")]
    
    var patchQuestionArray = [NSLocalizedString("What is the patch?", comment: ""), NSLocalizedString("How do I get it?", comment: ""), NSLocalizedString("Are there advantages in using the patch?", comment: ""), NSLocalizedString("Are there disadvantages in using the patch?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using the patch?", comment: "")]
    
    var patchInfoArray = [NSLocalizedString("\u{2022} The patch, called Ortho Evra Transdermal System® or Xulane® (generic), is used to prevent pregnancy. \n\n\u{2022} It looks like a clear bandage and is put on the skin of your stomach, rear end (buttocks), upper arm, or upper body (but not on a breast). \n\n\u{2022} The patch slowly lets go of hormones estrogen and progestin. The hormones are absorbed through the skin. \n\n\u{2022} Estrogen and progestin prevent pregnancy in 3 ways: \n\n\u{2022} They thicken the mucus of the cervix (the lower end of the uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} They change the lining of your uterus so nothing can attach to the uterus and grow. \n\n\u{2022} They stop the ovaries from letting eggs go so they do not meet the sperm. \n\n\u{2022} You put on a new patch and take off the old patch once a week for 3 weeks. During the fourth week every month, you go without a patch. During the week without the patch, you have your period. Your period may be very light.", comment: ""), NSLocalizedString("\u{2022} Your healthcare provider prescribes the patch.", comment: ""), NSLocalizedString("\u{2022} The patch is better in preventing pregnancy than barrier methods of birth control, such as the condom alone. \n\n\u{2022} It may reduce acne, heavy bleeding and cramping, and symptoms of premenstrual syndrome (PMS). \n\n\u{2022} It is easy. You put it on only 3 times each month. You do not have to stop sex to protect against pregnancy while using the patch unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} It is easy to check to see if you forgot to put one on.", comment: ""), NSLocalizedString("\u{2022} The patch does NOT protect against STDs, including HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, use a condom to protect yourself against infection. \n\n\u{2022} The patch may cause changes in your period. Your periods may not be regular, or you may have spotting between periods. You may also stop getting a period. \n\n\u{2022} The patch may be less effective in women who are overweight. If you weigh more than 198 pounds, it may not absorb well and may not be right for you. \n\n\u{2022} You must remember to change the patch on schedule.", comment: ""), NSLocalizedString("\u{2022} The patch can be a good method of birth control if used correctly. \n\n\u{2022} Out of 100 women who use the patch, about 5 women get pregnant. \n\n\u{2022} In the first year of use: \n\n\u{2022} When the patch is used exactly as directed, less than 1 woman out of 100 gets pregnant. \n\n\u{2022} When the patch is not used exactly as directed, 8 or more women out of 100 get pregnant. \n\n\u{2022} It is important to follow all instructions for using the patch, and to use another reliable method of birth control if your patch falls off and you do not replace it right away or you forget to put on a new patch.", comment: "")]
    
    var pillQuestionArray = [NSLocalizedString("What are birth control pills?", comment: ""), NSLocalizedString("Are there advantages to taking birth control pills?", comment: ""), NSLocalizedString("Are there disadvantages to taking birth control pills?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using the pill?", comment: ""), ""]
    
    var pillInfoArray = [NSLocalizedString("\u{2022} Birth control pills, also known as oral contraceptives or combined hormonal contraceptives, have two hormones in them: estrogen and progestin. \n\n\u{2022} Estrogen and progestin prevent pregnancy in 3 ways: \n\n\u{2022} They thicken the mucus of the cervix (the lower part of the uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} They change the lining of your uterus so a fertilized egg cannot attach to the uterus and grow. \n\n\u{2022} They stop the ovaries from letting eggs go so they cannot meet a sperm. \n\n\u{2022} You should take the pill at the same time every day, even on days that you do not have sex. \n\n\u{2022} The pill comes in a pack for about a month. \n\n\u{2022} It is taken for 28 days, but the last 7 days are an iron pill or a sugar pill. During the iron pill or sugar pill week, your period will begin.", comment: ""), NSLocalizedString("\u{2022} Birth control pills work better than barrier methods, such as condoms alone. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using the pill unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} Using the pill makes your periods regular. \n\n\u{2022} Using the pill makes your periods shorter with less bleeding and cramping. \n\n\u{2022} Using the pill may reduce the symptoms of premenstrual syndrome (PMS). The pills let you control your periods. You can have periods every month or every few months. Or you can choose not to have them at all. \n\n\u{2022} Using the pill can improve acne. \n\n\u{2022} Using the pill has been shown to help protect against the following health problems: cancer of the ovaries and the lining of the uterus, pelvic inflammatory disease (PID), benign (non-cancerous) breast tumors and cysts, ovarian cysts, endometriosis (a potential cause of infertility), and anemia.", comment: ""), NSLocalizedString("\u{2022} You have to take a pill at the same time every day to prevent pregnancy. \n\n\u{2022} The pill does NOT protect against STDs, such as HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, use a condom to protect against disease. \n\n\u{2022} Because the pill contains estrogen and progestin, the pill sometimes produces the following side effects: \n\n\u{2022} Spotting or bleeding between periods \n\n\u{2022} Missed periods \n\n\u{2022} Nausea \n\n\u{2022} Depression or irritability \n\n\u{2022} Breast tenderness \n\n\u{2022} Headaches \n\n\u{2022} Weight gain or loss \n\n\u{2022} Changes in sex drive \n\n\u{2022} Acne (usually improves but could worsen) \n\n\u{2022} It should be noted that pill side effects often get better once a woman has been on the pill a couple of months. Side effects also can be lessened or eliminated by changing pill brands. \n\n\u{2022} Some women who take the pill develop high blood pressure. It is rare, but some women will have blood clots, heart attacks, or strokes. Strokes are most likely to occur in smokers over the age of 35 years, so the pill will not be prescribed to women who smoke and are over 35 years of age.", comment: ""), NSLocalizedString("\u{2022} Using the pill is a good method of birth control if used correctly. \n\n\u{2022} Out of 100 women who use this method, less than 5 women get pregnant. \n\n\u{2022} In the first year of use: \n\n\u{2022} When combination pills are taken exactly as directed, less than 1 woman out of 100 gets pregnant. \n\n\u{2022} When pills are not taken exactly as directed, such as forgetting to take them sometimes, 8 or more women out of 100 get pregnant. \n\n\u{2022} It is important to follow all instructions for using the pill, and to use another method of birth control if you stop taking the pills or forget to take your pills.", comment: ""), ""]
    
    var minipillQuestionArray = [NSLocalizedString("What are mini-pills? ", comment: ""), NSLocalizedString("Are there advantages in taking mini-pills?", comment: ""), NSLocalizedString("Are there disadvantages in taking mini-pills?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using the mini-pill?", comment: ""), ""]
    
    var minipillInfoArray = [NSLocalizedString("\u{2022} Mini-pills have a hormone called progestin in them. They are different from regular combination birth control pills because they only have one hormone in them instead of two. \n\n\u{2022} Progestin works in 3 ways: \n\n\u{2022} It thickens the mucus of your cervix (the lower end of your uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} It changes the lining of your uterus so nothing can attach to the uterus and grow. \n\n\u{2022} It may stop the ovaries from letting eggs go so they cannot meet a sperm. \n\n\u{2022} Mini-pills come in packs for about a month. \n\n\u{2022} You have to take a pill every day at the same time to prevent pregnancy. This means you take a pill even when you have your period.", comment: ""), NSLocalizedString("\u{2022} Mini-pills work better than barrier methods such as condoms. \n\n\u{2022} Mini-pills may cause fewer side effects than combination birth control pills. They may reduce heavy bleeding and cramping during your period. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using the mini-pill unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} They do not contain estrogen. So you can use them if you do not want to take estrogen or if you have health problems or concerns about estrogen. They are safe to use while breastfeeding.", comment: ""), NSLocalizedString("\u{2022} Mini-pills do NOT protect against STDs, such as HIV (the virus that causes AIDS) or herpes. If you are not sure if your sexual partner has an STD or not, also use a condom to protect against disease. \n\n\u{2022} The mini-pill may cause changes in your period. Your periods may not be regular, or you may have spotting between periods. You may also stop getting a period if you are breastfeeding. \n\n\u{2022} You must take a pill at the same time every day to prevent pregnancy.", comment: ""), NSLocalizedString("\u{2022} The mini-pill can be a good method of birth control if used correctly. \n\n\u{2022} Out of 100 women who use this method, about 5 get pregnant. \n\n\u{2022} In the first year of use: \n\n\u{2022} When mini-pills are taken exactly as directed, less than 1 woman out of 100 gets pregnant. \n\n\u{2022} When pills are not taken exactly as directed, such as forgetting to take them sometimes, 8 or more women out of 100 get pregnant. \n\n\u{2022} It is important to follow all instructions for using the mini-pill, and to use another method of birth control if you stop taking the mini-pills or forget to take the mini-pills or stop breastfeeding.", comment: ""), ""]
    
    var barrierQuestionArray = [NSLocalizedString("What are barrier methods?", comment: ""), NSLocalizedString("Which barrier methods protect me from sexually transmitted infections (STIs)?", comment: ""), NSLocalizedString("How do I get a barrier method?", comment: ""), NSLocalizedString("Are there advantages in using barrier methods?", comment: ""), NSLocalizedString("Are there disadvantages in using barrier methods?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using barrier methods?", comment: "")]
    
    var barrierInfoArray = ["\u{2022} Barrier methods include the male condom, female condom, and sponges with spermicide. \n\n\u{2022} Barrier methods of birth control block the sperm from going into the uterus or womb. If you are going to use a barrier method, using a spermicide with a barrier method gives you the best protection from getting pregnant. \n\n\u{2022} The spermicide kills most of the sperm that enter the vagina. \n\n\u{2022} The barrier method then blocks any remaining sperm from reaching the egg. \n\n\u{2022} Spermicides come as a foam, cream, jelly, film, or tablet. \n\n\u{2022} Barrier methods with spermicides are used only when you have sex. \n\n\u{2022} Barrier methods and water-base lubricants can be bought in a drug store. \n\n\u{2022} Be sure to read the instructions before using a barrier method. It is very important that you use a barrier method correctly every time you have sex. \n\n\u{2022} Male condom—Worn by the man, a male condom keeps sperm from getting into a woman’s body. Latex condoms are the most common type. They help prevent pregnancy, and HIV and other sexually transmitted diseases (STDs). The newer synthetic condoms also protect from STDs. “Natural” or “lambskin” condoms help prevent pregnancy. They may not protect against STDs, including HIV. \n\n\u{2022} Condoms can only be used once. Do not use oil-based lubricants such as massage oils, baby oil, lotions, or petroleum jelly with latex condoms. They will weaken the condom, causing it to tear or break. \n\n\u{2022} Female condom—Worn by the woman, the female condom helps keeps sperm from getting into her body. It can be put in up to eight hours before sex. \n\n\u{2022} Spermicides—These products work by killing sperm. They come in several forms—foam, gel, cream, film, suppository, or tablet. They are placed in the vagina no more than one hour before sex. You leave them in place at least six to eight hours after sex. You can use a spermicide with a male condom. \n\n\u{2022} Sponge with spermicide – This is a disk-shaped plastic device that is shaped like a disk with spermicide in it. It is put in the vagina before sex. It protects for up to 24 hours if left in place. You must leave the sponge in place for at least 6 hours after sex. It must be removed within 30 hours after it is put in place.", "\u{2022} Male or female condoms are the only birth control methods that protect against sexually transmitted infections (STIs), including herpes and HIV (the virus that causes AIDS). \n\n\u{2022} To help protect yourself and your partner from getting or spreading a STI, be sure to use a condom every time you have sex.", "\u{2022} Male condoms, female condoms, sponge with a spermicide, and all the different types of spermicides can be bought at drug stores.", "\u{2022}  Male or female condoms are the only birth control methods that protect against STDs, including HIV (the virus that causes AIDS) and herpes. \n\n\u{2022} Barrier methods do not affect a woman or man's future fertility. Barrier methods are a good choice if you are planning to become pregnant soon and prefer a method you can stop using anytime you want. \n\n\u{2022} Barrier methods are only used at the time of sex. Barrier methods are a good choice if you want an option that does not require hormones or insertion of an implant or intrauterine device (IUD). \n\n\u{2022} Barrier methods do not affect other health conditions such as high blood pressure. \n\n\u{2022} Barrier methods are less expensive than some of the other methods of birth control, and others you can get without a prescription. \n\n\u{2022} Barrier methods are a good choice if you are breast-feeding in addition to certain birth control pills.", "\u{2022} Couples who use barrier methods have the highest pregnancy rates than if they used any other type of birth control. \n\n\u{2022} It must be used EVERY time you have intercourse. \n\n\u{2022} Some couples find barrier methods embarrassing to use or they do not want a barrier method to interrupt sex. \n\n\u{2022} The man or the woman may develop allergies to spermicides.", "\u{2022} Barrier methods of birth control vary in their ability to prevent pregnancy. They also vary in how effective they are at preventing STIs. \n\n\u{2022} Using a barrier method as birth control is not a good method for preventing pregnancy."]
    
    var emergencyQuestionArray = [NSLocalizedString("What is emergency birth control?", comment: ""), NSLocalizedString("How do I get the emergency birth control?", comment: ""), NSLocalizedString("If you do use emergency birth control, be sure to follow up with your healthcare provider to find an effective, ongoing method of birth control for you.", comment: ""), NSLocalizedString("Are there advantages in using emergency birth control?", comment: ""), NSLocalizedString("Are there disadvantages in using emergency birth control?", comment: ""), NSLocalizedString("What is the possibility of getting pregnant while using emergency birth control?", comment: "")]
    
    var emergencyInfoArray = [NSLocalizedString("\u{2022} Emergency birth control is what you use after you have had unprotected sex - if you did not use birth control or your regular birth control failed (for example, if you forgot to take the pill or a condom broke). \n\n\u{2022} The most common emergency birth control is available as pill, sometimes called “morning-after pill.” \n\n\u{2022} The pills must be taken within 5 days of having unprotected sex but work better when taken sooner – within 3 days is best. These pills contain progestin. \n\n\u{2022} Progestin works in 3 ways: \n\n\u{2022} It thickens the mucus of the cervix (the lower part of the uterus or womb), which keeps sperm from meeting with the egg. \n\n\u{2022} It changes the lining of your uterus so that nothing can attach to the uterus. \n\n\u{2022} It may stop the ovaries from letting eggs go so they cannot meet the sperm.", comment: ""), NSLocalizedString("\u{2022} One type of progestin-only pill (Plan B One- Step®) can be bought at a pharmacy without a prescription to anyone of any age. Another type of progestin-only pill (Next Choice One Dose®) is available behind the pharmacy counter without a prescription to anyone 17 years or older if you show proof of age and by prescription if you are younger than 17 years old. \n\n\u{2022} The pills come in 1-pill or 2-pill packages. Follow the directions in the package.", comment: ""), NSLocalizedString("\u{2022} Emergency birth control does not protect you for the rest of your cycle. \n\n\u{2022} Regular use of this method is not as good as other hormonal methods.", comment: ""), NSLocalizedString("\u{2022} It is safe and effective in reducing the risk of pregnancy after unprotected sex. \n\n\u{2022} It is available at a pharmacy, without a prescription if you are older than 17 or from your healthcare provider at any age. \n\n\u{2022} It does not require consent from your sexual partner.", comment: ""), NSLocalizedString("\u{2022} It only works if taken within 5 days of unprotected sex, but works best if used within 3 days – but even sooner is better. \n\n\u{2022} Emergency contraception does NOT protect against sexually transmitted diseases (STDs), such as HIV (the virus that causes AIDS) or herpes. \n\n\u{2022} Emergency contraception may cause spotting or irregular/delayed periods. It may also cause nausea and headache. \n\n\u{2022} If a woman is already pregnant, emergency birth control will not work.", comment: ""), NSLocalizedString("\u{2022} Emergency contraception works well as a backup plan. The sooner you use it after unprotected sex or birth control failure, the more likely it is to prevent pregnancy.  Plan B® can prevent about 89% of pregnancies if taken within 3 days of unprotected sex. \n\n\u{2022} If you haven't started your period within 2-3 weeks after using emergency contraception, get a pregnancy test. \n\n\u{2022} You can start your hormonal birth control the same day as this method", comment: "")]
    
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
            
            IUDInfoArray.append(NSLocalizedString("\u{2022} An IUD is a small, soft, flexible T-shaped device that is wrapped in copper or contains hormones. A health care provider puts it into your uterus or womb through your vagina.\n\n\u{2022} A thin plastic string tied to the end of the IUD hangs down through the cervix (the lower end of your uterus or womb) into the vagina. You can check that the IUD is in place by feeling for this string every month. Your sex partner cannot feel the string during sex. The string is also used by your healthcare provider to take the IUD out.", comment: ""))
            
            IUDInfoArray.append(NSLocalizedString("test", comment: ""))
            IUDInfoArray.append(NSLocalizedString("\u{2022} Putting in an IUD only takes a few minutes and can be done in the health care provider’s office. \n\n\u{2022} When it is put in, you might feel a little pinching or cramping. \n\n\u{2022} Light cramping and spotting may occur for 1-2 days after it is put in. \n\n\u{2022} You may return to your normal daily routine after the IUD is put in.", comment: ""))
            
            IUDInfoArray.append(NSLocalizedString("\u{2022} An IUD is very good in preventing pregnancy for a long period of time. \n\n\u{2022} Having an IUD is easy, as you do not have to take a daily pill or change a patch weekly or change a ring monthly. \n\n\u{2022} You do not have to stop sex to protect against pregnancy while using an IUD unless you are also using condoms to prevent sexually transmitted diseases (STDs). \n\n\u{2022} Your partner will not feel an IUD during sex or know that it is there. \n\n\u{2022} It is safe to use if you are breastfeeding \n\n\u{2022} An IUD can be taken out if you have problems or want to stop using it. You can get pregnant soon after it is removed.", comment: ""))
            
            IUDInfoArray.append(NSLocalizedString("\u{2022} It may cost more, but the costs may be reduced or free at a community clinic or if you have health insurance. It also costs to have the IUD removed. However, if an IUD is used for 5 years or longer, it is the cheapest form of birth control. \n\n\u{2022} The IUD does NOT protect against sexually STDs, including HIV (the virus that causes AIDS) or herpes. If you are not sure if your sex partner has a STD or not, use a condom to help protect against infection. \n\n\u{2022} You are checked for STDs before getting an IUD to prevent any infection from moving from your vagina into your uterus. \n\n\u{2022} For the copper IUD, you might have heavier, longer periods, and some spotting between periods for a few months. After about four months, your body gets used to having the copper IUD in place. \n\n\u{2022} The hormonal IUD can cause hormonal side effects like those caused by any birth control method that contains progestin such nausea, headaches, and dizziness. When side effects do happen, they usually go away after the first few months.", comment: ""))
            
            IUDInfoArray.append(NSLocalizedString("\u{2022}A health care provider puts it into your uterus during an office visit. \n\n\u{2022} After it is put in, you only need to do monthly string checks at home. \n\n\u{2022} To do a monthly string check, put a finger into your vagina and feel for the cervix, which is at the top of the vagina and feels harder than the rest of your vagina (some women say it feels like the tip of your nose). You should be able to feel the thin, plastic string coming out of the opening of your cervix. It may be wrapped around the cervix, which can make it hard to find. \n\n\u{2022} If you cannot feel the string, it does not always mean that the IUD has come out of the uterus. Use another form of birth control until your health care provider makes sure that the IUD is still in place. \n\n\u{2022} If you have no problems, check the string after each period and return to your doctor once a year for a checkup.", comment: ""))
            
            IUDInfoArray.append(NSLocalizedString("\u{2022}Using an IUD is one of the best methods of birth control. \n\n\u{2022} Out of 100 women who use this method, less than 1 woman gets pregnant.", comment: ""))
            
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
            cell.titleLabel.text = implantQuestionsArray[row] as String
            cell.infoView.text = implantInfoArray[row] as String
            
            case NSLocalizedString("Birth Control Shot", comment: ""):
            cell.titleLabel.text = shotQuestionArray[row] as String
            cell.infoView.text = shotInfoArray[row] as String
            
            case NSLocalizedString("Vaginal Ring", comment: ""):
            cell.titleLabel.text = ringQuestionArray[row] as String
            cell.infoView.text = ringInfoArray[row] as String
            
            case NSLocalizedString("Patch", comment: ""):
            cell.titleLabel.text = patchQuestionArray[row] as String
            cell.infoView.text = patchInfoArray[row] as String
            
            case NSLocalizedString("Pill", comment: ""):
            cell.titleLabel.text = pillQuestionArray[row] as String
            cell.infoView.text = pillInfoArray[row] as String
            
            case NSLocalizedString("Mini-Pill", comment: ""):
            cell.titleLabel.text = minipillQuestionArray[row] as String
            cell.infoView.text = minipillInfoArray[row] as String
            
            case NSLocalizedString("Condom – Male and Female", comment: ""):
            cell.titleLabel.text = barrierQuestionArray[row] as String
            cell.infoView.text = barrierInfoArray[row] as String
            
            case NSLocalizedString("Spermicide", comment: ""):
            cell.titleLabel.text = barrierQuestionArray[row] as String
            cell.infoView.text = barrierInfoArray[row] as String
            
            case NSLocalizedString("Sponge with Spermicide", comment: ""):
            cell.titleLabel.text = barrierQuestionArray[row] as String
            cell.infoView.text = barrierInfoArray[row] as String
            
            case NSLocalizedString("Emergency Contraception", comment: ""):
            cell.titleLabel.text = emergencyQuestionArray[row] as String
            cell.infoView.text = emergencyInfoArray[row] as String
            
            case NSLocalizedString("Long-Acting Reversible Contraceptives (LARC)", comment: ""):
            cell.titleLabel.text = IUDQuestionsArray[row] as String
            cell.infoView.text = IUDInfoArray[row] as String
            
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
