
import '../models/question.dart';
import '../models/player.dart';
import '../models/match.dart';
const List<Question> initialQuestions = [
  Question(id:'hist_001',type:QuestionType.history,difficulty:Difficulty.easy,questionAr:'في أي سنة تأسس النادي الإفريقي؟',questionTn:'وقتاش تأسس الإفريقي؟',options:['1920','1919','1925','1930'],correctIndex:0,hint1:'بعد الحرب العالمية الأولى',hint2:'4 أكتوبر',source:'الموقع الرسمي clubafricain.com.tn',date:'1920-10-04',points:10),
  Question(id:'hist_002',type:QuestionType.history,difficulty:Difficulty.medium,questionAr:'كم عدد ألقاب البطولة التونسية للإفريقي؟',questionTn:'قداش عندنا بطولات؟',options:['10','13','11','15'],correctIndex:1,source:'FTF - سجل البطولات حتى 2024',date:'2024-06-01',points:20),
  Question(id:'hist_003',type:QuestionType.history,difficulty:Difficulty.easy,questionAr:'ما هو لقب النادي الإفريقي؟',questionTn:'شنو لقبنا؟',options:['الإفريقي','باب الجديد','الغالية','الكل صحيح'],correctIndex:3,source:'ثقافة جماهيرية',date:'2024-01-01',points:10),
  Question(id:'derby_001',type:QuestionType.derby,difficulty:Difficulty.medium,questionAr:'ما هو أكبر انتصار للإفريقي في الدربي؟',questionTn:'أكبر سكور ربحنا بيه الدربي؟',options:['5-1 سنة 1985','3-0 سنة 1969','5-2 سنة 1992','4-0 سنة 1978'],correctIndex:0,source:'أرشيف FTF - دربي 1985-11-17',date:'1985-11-17',points:30),
  Question(id:'pro_001',type:QuestionType.pro,difficulty:Difficulty.hard,questionAr:'كم مرة فاز الإفريقي بدوري أبطال إفريقيا؟',questionTn:'قداش مرة هزينا الشامبينز ليغ؟',options:['0','1','2','3'],correctIndex:1,source:'CAF - سجل الأبطال 1991',date:'1991-12-14',points:40),
  Question(id:'guess_001',type:QuestionType.guessPlayer,difficulty:Difficulty.medium,questionAr:'طلع اللاعب - مهاجم هداف الدربي',questionTn:'زعمة شكون؟ مهاجم وضرب الترجي',options:['حمدي العبيدي','ياسين الشماخي','صابر خليفة','بسام الصرارفي'],correctIndex:0,imageAsset:'assets/images/player_placeholder.png',hint1:'مهاجم',hint2:'رقم 9',source:'FTF 2022-2023',date:'2023-05-07',points:20),
  Question(id:'who_001',type:QuestionType.whoScored,difficulty:Difficulty.medium,questionAr:'مباراة الإفريقي 1-0 الترجي 7 ماي 2023 - شكون سجل؟',questionTn:'دربي 7 ماي 2023 شكون مركى؟',options:['حمدي العبيدي','آدم الطاوس','شهاب العبيدي','أحمد خليل'],correctIndex:0,source:'FTF تقرير 07/05/2023',date:'2023-05-07',points:20),
];
const List<PlayerInfo> initialPlayers = [
  PlayerInfo(id:'p1',nameAr:'حمدي العبيدي',position:'مهاجم',number:'9',imageAsset:'assets/images/player_placeholder.png',hintPosition:'مهاجم صريح',hintCareer:'هداف 2022-2023',source:'FTF'),
];
const List<MatchInfo> initialMatches = [
  MatchInfo(id:'m_derby_2023',opponent:'الترجي الرياضي',date:'2023-05-07',competition:'الرابطة 1',result:'1-0 للإفريقي',scorer:'حمدي العبيدي',options:['حمدي العبيدي','آدم الطاوس','شهاب العبيدي','أحمد خليل'],source:'FTF تقرير 07/05/2023'),
];
