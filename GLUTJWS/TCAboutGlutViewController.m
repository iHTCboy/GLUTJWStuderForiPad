//
//  TCAboutGlutViewController.m
//  GLUTJWS
//
//  Created by HTC on 14-10-11.
//  Copyright (c) 2014年 JoonSheng. All rights reserved.
//

#import "TCAboutGlutViewController.h"

@interface TCAboutGlutViewController ()

@end

@implementation TCAboutGlutViewController

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)mottoTitle andTag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        
        self.tag = tag;
        self.mottoTitle = mottoTitle;
        self.view.frame = frame;
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏属性
    UIView *_navView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0, self.view.frame.size.width, 64)];
    ((UIImageView *)_navView).backgroundColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:252/255.0 alpha:1];
    [self.view addSubview:_navView];
    _navView.userInteractionEnabled = YES;
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_navView.frame.size.width - 200)/2, (_navView.frame.size.height - 20)/2, 200, 40)];
    [titleLabel setText:self.mottoTitle];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [_navView addSubview:titleLabel];
    
    
    //左栏
    UIButton *lbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [lbtn setFrame:CGRectMake(10, 20, 40, 40)];
    [lbtn setImage:[UIImage imageNamed:@"navigationbar_back_os7@2x"] forState:UIControlStateNormal];
    lbtn.adjustsImageWhenHighlighted = NO;
    [lbtn addTarget:self action:@selector(backMove) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:lbtn];
    
    
    
    UIImageView * motooV = [[UIImageView alloc ]initWithFrame:self.view.bounds];
    [self.view addSubview:motooV];
    
    
    UITextView * info = [[UITextView alloc]init];
    
    UIImageView * logoV = [[UIImageView alloc]init];
 
    
    
    switch (self.tag)
    {
        case 0://关于桂工
            
            info.frame  = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64);
            info.text = @"      1956年，正值年轻的共和国大规模开展工业化建设的火红年代，为满足祖国建设需要，培养紧缺的地矿类专业技术人才，国家重工业部在广西组建了桂林地质学校。2009年3月，学校正式更名为桂林理工大学。。\n\n      半个多世纪以来，学校五改归属、十易校名，始终坚持社会主义办学方向，以人才培养、科学研究为己任，共为国家培养了10多万名各类高级专业技术和管理人才。所培养学生以专业基础扎实、工作实践能力强而倍受社会称赞。。\n\n      学校现有屏风、雁山、安吉、空港四个校区，校园总面积4000多亩。设19个二级学院，有69个本科专业，各类全日制在校生27000多人。是一所以工学为主，理、管、文、经、法、艺7大学科门类协调发展的多科性高等学校。。\n\n      学校“地质资源与地质工程”、“环境科学与工程”两个学科2014年获批准新设为博士后科研流动站。2013年获得博士学位授权单位，地质资源与地质工程、材料科学与工程、环境科学与工程三个一级学科获批为博士学位授权学科。学校1986年获得硕士学位授予权。目前已有16个一级学科硕士授权点，有工程硕士、工商管理硕士、旅游管理硕士、公共管理硕士和会计硕士5个专业学位类别，其中已经获得11个工程硕士专业领域。现全日制在校研究生近2000人。2011年，学校入选教育部“第二批卓越工程师教育培养计划高校”，有7个学科领域列入教育部研究生层次卓越工程师培养计划；5个专业列入本科专业卓越工程师教育培养计划。2010年，学校成功获得推荐优秀应届本科毕业生免试攻读硕士研究生资格，成为广西第五所获得“推免”资格的高校。已成规模且管理规范的研究生教育体系成为学校办学实力和水平的重要标志。。\n\n      学校师资力量雄厚。有专任教师1400多人，其中，高级专业技术职务教师600多人，博士生导师42人。入选国家“千人计划”1人、中科院“百人计划”1人、国家“百千万知识产权人才工程”百名高层次人才培养人选1人、国家“十二五”863计划主题专家组成员1人，享受国家特殊津贴专家13人，有教育部优秀教师资助计划2人、高等学校骨干教师资助计划2人、新世纪优秀人才支持计划2人，全国优秀教师、优秀骨干教师4人，国家专业教学指导委员会委员6人；省部级“十百千人才工程”人选16人，省部级学科、学术带头人42人，自治区八桂学者2人、特聘专家1人，八桂名师1人，广西优秀专家和突出贡献的科技人员10人；广西高校人才小高地创新团队7个、创新团队“八桂学者”4人、团队带头人3人，广西高校教学名师8人、广西优秀教师2人、杰出科技人才2人、优秀人才资助计划21人。学校从国内外重点大学和科研院所聘请知名专家、学者为讲座教授5人、客座教授140余人，其中有十多位长江学者和两院院士。。\n\n      学校坚持“育人为本、质量立校、人才强校”的办学理念，狠抓质量生命线，以学科建设为龙头，以打造精品为抓手，加大科技创新平台建设的力度，取得了骄人的成绩。。\n\n      学校现有国家级质量工程项目20项：资源勘查工程、水污染控制工程2个国家级教学团队；《基础地质学》、《测量学》、《水污染控制工程》、《普通化学》4门国家精品课程；《管理学》国家级双语教学示范课程；《水污染控制技术》国家精品视频公开课程；基础地质、水污染控制2个国家级实验教学示范中心；资源勘查工程国家级人才培养模式创新实验区；资源勘查工程、勘查技术与工程、化学工程与工艺、旅游管理、环境工程5个国家级特色专业建设点；环境工程国家级专业综合改革试点项目；《基础地质学》、《水污染控制工程》2个国家级精品资源共享课立项项目；1个国家级大学生校外实践教育基地。此外，有8个广西教学团队，29门广西本科精品课程，4个广西精品专业、重点专业，17个广西优质专业，7个广西实验教学示范（建设）中心。10项广西高等学校特色专业及课程一体化建设项目。。\n\n      学校有“广西有色金属及特色材料加工重点实验室”国家重点实验室培育基地、“有色金属及材料加工新技术实验室”教育部重点实验室、“有色及贵金属隐伏矿床勘查教育部工程研究中心”。有6个自治区重点实验室，“十一五”以来共获广西重点学科24个，其中5个为广西优势特色重点学科。这些优势品牌学科专业及科技创新平台，使学校在人才培养、科学研究和服务地方经济建设的征途上高奏凯歌。。\n\n      学校教学改革成果丰硕。近年来，承担省级教育科研、教学改革项目300多项，获得国家和省部级教学成果奖60多项，其中，2014年学校获得2项高等教育国家级教学成果奖；主编、出版教材100多本，其中获国家级奖3本、省部级奖21本，9本教材评选为“十一五”国家级规划教材、1本教材评选为“十二五”本科国家级规划教材，《电子测量技术（第二版）》是唯一由广西高校教师主编的国家级精品教材；在全国多媒体教学课件比赛中获特等奖1项、一等奖17项，多个课件获最佳技术实现奖、最佳教学设计奖等，成绩位居广西高校前列。。\n\n      学校科研实力日益增强。1987年曾获得国家科技进步特等奖，这是迄今为止广西高校科研成果获得的最高奖项，2011年获国家技术发明二等奖，还获得过国家教委和广西科技进步一等奖。2005年以来，科研成果获得省部级奖70余项，其中，2010年获全区唯一1个自然科学奖一等奖。承担国家级、省部级等各类科研项目3900余项，其中国家“973”前期专项、国家“863”、国家科技支撑、国家自然科学基金、国家国际合作、国家社会科学基金等国家级项目240余项。2012年获得1个广西国际科技合作基地。获专利授权290余项，被国家知识产权局列为广西第二所知识产权工作试点高校，连续7年被评为全区知识产权工作先进单位，专利申请量和授权量均居广西高校第二位。《桂林理工大学学报》为全国综合性科学技术类中文核心期刊，多次被评为全国、广西高校优秀科技期刊。。\n\n      学校把学科建设与社会需要紧密结合作为打造办学特色品牌的切入点，立足广西，面向全国，服务社会，走产学研相结合的发展道路。近年来承担的应用型研究和为地方经济建设服务的项目近2700项，产生了良好的社会效益和经济效益。获得广西创新计划（2008-2010年）实施先进单位荣誉称号，是获此殊荣的唯一一所高校，连续3年获广西高校“三对创新行动计划”先进集体。。\n\n      学校把培养具有创新精神和实践能力的应用型技术人才作为目标定位，并形成了鲜明的特色。在以“挑战杯”为龙头的大学生课外学术科技作品竞赛中，连续八届比赛总分名列广西高校第一，连续八届获全国“高校优秀组织奖”，并连续被确定为“挑战杯”全国大学生课外学术科技作品竞赛广西唯一发起单位，在全国和全区大学生数学建模、大学生地质技能、电子设计、智能汽车、工程训练综合能力、英语大赛、化学化工类论文及设计等竞赛中成绩卓著。学校积极组织学生开展社会实践和志愿服务工作，多次获得全国大学生“社会实践先进集体”和广西区“大学生志愿服务西部计划先进单位”荣誉称号。此外，学校校园文化活动蓬勃开展，两项校园文化成果获得教育部高校校园文化成果优秀奖。学生参加全国和省（区）级体育比赛成绩喜人，共获奖100多项。先后涌现出“全国先进班集体”、“全国优秀共青团员”和“中国青少年科技创新奖”等一批先进集体和个人。。\n\n      进入新世纪以来，全校毕业生的一次就业率年均达90%以上，2009年，荣获“全国普通高等学校毕业生就业工作先进集体”荣誉称号。已连续12年获得“全区普通高校毕业生就业工作先进集体”荣誉称号，并获得“2012年度全区普通高校毕业生就业统计工作先进单位”。。\n\n      海纳百川，取则行远。学校先后与美国、英国、德国、日本、澳大利亚等20多个国家的100多所高校建立了友好合作关系，其中，与48所著名高校签订了学术交流、人才培养与科研合作协议；承办了多场国际学术研讨、交流会；由英国皇家宝石协会设在本校的FGA考点的考试通过率连续5年名列世界各考点第一，被国际珠宝界传为佳话。留学生教育工作稳步开展，至今已有来自40多个国家的留学生1500多人。。\n\n      学校先后被授予国家级“绿化先进单位”，自治区“文明单位”、“文明小区”、“绿色大学”、“普法依法治理工作先进单位”、“安全文明学校”和“卫生学校”等荣誉称号。如今，学校各项事业蒸蒸日上，党的组织坚强有力，精神文明硕果累累，校园文化异彩纷呈，后勤服务优质高效，校园管理和谐平安。。\n\n      卓尔有大为，出海扬风帆。2009年，在桂林理工大学第一次党代会上，确定了建设特色鲜明的高水平理工大学的新的奋斗目标。正确的办学定位，无可替代的学科优势、雄厚的师资力量和技术水平，使桂林理工大学在科教兴国、服务地方经济建设的征途上阔步走向明天的壮丽与辉煌。（数据截止到2014年10月1日）。\n\n地址：广西桂林市建干路12号\n邮编：541004 \n电话：0773-5896079\n图文传真：0773-5892796\n网址：http://www.glut.edu.cn\nAdd: 12#Jian Gan Rd.Guilin Guangxi\nTel: 86-773-5896079\nFax: 86-773-5892796 \nweb site: http://www.glut.edu.cn";
            
             info.font = [UIFont systemFontOfSize:23];
             info.editable = NO;
            [self.view addSubview:info];
            break;
            
        case 1:
            
            info.frame  = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height -64);
            info.text = @"桂林理工大学之歌\n\n 作词：于海平 王赣华 叶昊\n 作曲：孟庆峰 王赣华\n \n\n 七星叠翠，漓水流长，\n 屏风紫气蔚霞光。\n 英才竞秀，弦歌一堂，\n 满园丹桂沁书香。\n \n 厚德笃学，惟实励新，\n 厚德笃学，惟实励新！\n 冶金地质奠基业，\n 桂工精神永传扬。\n \n 鸿雁凌空，风物放眼，\n 鸿雁凌空，风物放眼！\n 大道致远当自强，\n 为学兴邦铸辉煌。";

            info.font = [UIFont systemFontOfSize:32];
            info.textAlignment = NSTextAlignmentCenter;
            info.editable = NO;
            [self.view addSubview:info];
            break;
            
        case 2:
        {

            logoV.image = [UIImage imageNamed:@"jicga.png"];
            logoV.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.13);
            logoV.bounds = CGRectMake(0, 0, 150, 150);
            [self.view insertSubview:logoV belowSubview:_navView];
            
            
            UILabel * name = [[UILabel alloc]init];
            name.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.21);
            name.bounds = CGRectMake(0, 0, 320, 80);
            name.text = @"计算机协会";
            name.textAlignment = NSTextAlignmentCenter;
            name.font = [UIFont boldSystemFontOfSize:33];
            [self.view addSubview:name];
            
            UILabel * version = [[UILabel alloc]init];
            version.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.24);
            version.bounds = CGRectMake(0, 0, 200, 80);
            version.text = @"2006年10月 - 至今";
            version.textAlignment = NSTextAlignmentCenter;
            version.font = [UIFont systemFontOfSize:18];
            version.textColor = TCCoror(147, 147, 147);
            [self.view addSubview:version];
            
            info.frame  = CGRectMake(0,self.view.frame.size.height * 0.26, self.view.frame.size.width, self.view.frame.size.height - self.view.frame.size.height * 0.24);
            
            info.text = @"      桂林理工大学计算机协会成立于2006年10月,是在我校原网页制作室和原电脑协会的基础上成立的,是一个有一定历史的学生组织.我协会是以我校广大计算机爱好者为主体,是电脑爱好者们学习和交流计算机知识的平台,是一个集计算机知识传授与会员实践操作为一体的综合社团.作为校社团联合会下设的25个校级社团之一。\n\n      协会旨在为我校学生提供一个普及计算机知识，提高计算机知识及应用水平的平台。我们本着丰富课余生活，调动学生的积极性，培养创新能力和初级计算机软硬件开发能力，激发广大同学对计算机的兴趣，团结大家共同学习电脑知识，提高计算机操作水平，共享计算机资源的目的，同时为同学们做好服务，协助的工作。\n\n      计算机协会坚持的基本目标与任务，发展同学们的兴趣爱好，鼓励同学们充分发挥自己计算机方面的特长。采取多种形式开展计算机知识普及以及经验交流研究活动，丰富同学们的课余生活，提高同学们的计算机水平，培养同学们的计算机应用能力。配合校团委，参与并组织我院各项科技类活动，与各个社团建立友好的关系，并配合各社团进行经验交流活动。组织会员进行学习交流和技术研讨，加强联系，扩大我协会的知名度。\n\n      协会下设理事会、秘书处、策划部、技术部、服务部、微软兴趣小组、外联部、宣传部及技术顾问，各部门分工明确，在相对独立的基础上通力合作，各尽其则完成各项工作。\n\n这里，聚集了众多的计算机高手；\n这里，是计算机爱好者交流的平台；\n这里，为你敞开一片自由的天地！\n没有固守的制度，没有言语的束缚，没有辈分的高低。\n不管你是菜鸟，还是高手，\n这里永远为爱好计算机的你，提供一个平台，让你展示，让你实践，让每一个加入我们的你都成高手！\n\n\n【计算机协会义务维护】\n      计算机协会每个月都会定期举办计算机义务维护活动，免费为全校师生解决计算机的常见问题，以及介绍组装计算机的相关知识，同时增进我们协会与师生的友谊，同时让雷锋精神在我们身边绽放出最美的花朵。\n\n【举办地点】：学校1、2号饭堂前\n【时间】：具体时间请关注学校公告栏，或关注计算协协会微博：\n http://weibo.com/gutca\n\n计算机协会2014届会员群: 346796885\n \n【说明】：计算机协会在学校内举办的活动全部免费！届时欢迎同学们和老师们一起乐于其中，一起提高我们学校的计算机水平！";
            
            info.font = [UIFont systemFontOfSize:23];
            info.editable = NO;
            [self.view addSubview:info];
            
            break;
        }
            
        case 3:
            
            
            break;
            
        case 4:
            
            break;
            
        case 5:
            
            
            break;
            
        case 6:
            
            
            break;
            
        default:
            break;
    }
    
}






//点击左上角箭头时，返回
-(void)backMove
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backMove" object:nil userInfo:nil];
    
}

@end
