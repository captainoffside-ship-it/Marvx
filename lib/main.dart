import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const kBlue = Color(0xFF8EC9FA);
const kLight = Color(0xFFE6F2FF);
final lang = ValueNotifier<String>('ar');

const kStr = {
  'ar': {
    'tag': 'تقارب وزواج في الشرق الأوسط',
    'girl': 'دخول / تسجيل — بنت',
    'boy': 'دخول / تسجيل — ولد',
    'regF': 'إنشاء حساب — بنت',
    'regM': 'إنشاء حساب — ولد',
    'name': 'الاسم',
    'age': 'السن (18 فأكثر)',
    'country': 'الدولة',
    'region': 'المحافظة / المنطقة',
    'verify': 'التوثيق',
    'video': 'فيديو تعريفي (15 ثانية على الأقل)',
    'id': 'صورة البطاقة (للأدمن فقط)',
    'p1': 'صورة شخصية 1',
    'p2': 'صورة شخصية 2',
    'noai': 'لا نقبل الصور المصنوعة بالذكاء الاصطناعي. الحساب يتفعّل بعد مراجعة الأدمن.',
    'submit': 'إرسال للمراجعة',
    'err': 'أكمل كل البيانات والملفات، والسن 18 فأكثر',
    'sent': 'تم الإرسال للمراجعة',
    'home': 'ملفات موثّقة',
    'user': 'اسم المستخدم',
    'chat': 'محادثة',
    'ptitle': 'ابدأ المحادثة',
    'pbody': 'ادفع 55 جنيه مرة واحدة، وتتكلم مع 5 أشخاص لحد آخر الشهر.',
    'pay': 'ادفع 55 جنيه',
    'addon': 'باقة إضافية — 55 جنيه',
    'soon': 'الدفع هيتفعّل في المرحلة الجاية',
    'verified': 'موثّق',
  },
  'en': {
    'tag': 'Matchmaking & marriage in the Middle East',
    'girl': 'Login / Sign up — Female',
    'boy': 'Login / Sign up — Male',
    'regF': 'Create account — Female',
    'regM': 'Create account — Male',
    'name': 'Name',
    'age': 'Age (18+)',
    'country': 'Country',
    'region': 'Governorate / Region',
    'verify': 'Verification',
    'video': 'Intro video (at least 15 seconds)',
    'id': 'ID card photo (admin only)',
    'p1': 'Personal photo 1',
    'p2': 'Personal photo 2',
    'noai': 'AI-generated photos are not accepted. Your account is activated after admin review.',
    'submit': 'Submit for review',
    'err': 'Fill in all data and files, and age must be 18+',
    'sent': 'Sent for review',
    'home': 'Verified profiles',
    'user': 'Username',
    'chat': 'Chat',
    'ptitle': 'Start chatting',
    'pbody': 'Pay 55 EGP once and talk to 5 people until the end of the month.',
    'pay': 'Pay 55 EGP',
    'addon': 'Add-on package — 55 EGP',
    'soon': 'Payment will be enabled in the next phase',
    'verified': 'Verified',
  },
};

const kCountries = [
  ['مصر', 'Egypt'], ['السعودية', 'Saudi Arabia'], ['الإمارات', 'UAE'],
  ['الكويت', 'Kuwait'], ['قطر', 'Qatar'], ['البحرين', 'Bahrain'],
  ['عُمان', 'Oman'], ['الأردن', 'Jordan'], ['لبنان', 'Lebanon'],
  ['العراق', 'Iraq'], ['سوريا', 'Syria'], ['فلسطين', 'Palestine'],
  ['اليمن', 'Yemen'], ['ليبيا', 'Libya'],
];

String tr(String k) => kStr[lang.value]![k]!;

void main() => runApp(const MarsxApp());

class MarsxApp extends StatelessWidget {
  const MarsxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: lang,
      builder: (_, l, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marsx',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: (c, child) => Directionality(
          textDirection: l == 'ar' ? TextDirection.rtl : TextDirection.ltr,
          child: child!,
        ),
        home: const Welcome(),
      ),
    );
  }
}

class Lx extends StatelessWidget {
  final Widget Function() b;
  const Lx(this.b, {super.key});
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String>(
        valueListenable: lang,
        builder: (_, __, ___) => b(),
      );
}

Widget langBtn() => TextButton(
      onPressed: () => lang.value = lang.value == 'ar' ? 'en' : 'ar',
      child: Text(
        lang.value == 'ar' ? 'English' : 'العربية',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );

Widget btn(String text, VoidCallback f, {bool fill = true}) {
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14));
  const label = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  return SizedBox(
    width: double.infinity,
    height: 52,
    child: fill
        ? FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: kBlue, foregroundColor: Colors.black, shape: shape),
            onPressed: f,
            child: Text(text, style: label))
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(color: kBlue, width: 2),
                shape: shape),
            onPressed: f,
            child: Text(text, style: label)),
  );
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return Lx(() => Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent, elevation: 0, actions: [langBtn()]),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                        color: kLight, borderRadius: BorderRadius.circular(28)),
                    child: const Icon(Icons.diamond_outlined, size: 64),
                  ),
                  const SizedBox(height: 16),
                  const Text('Marsx',
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(tr('tag'), textAlign: TextAlign.center),
                  const SizedBox(height: 40),
                  btn(tr('girl'), () => go(context, 'f')),
                  const SizedBox(height: 12),
                  btn(tr('boy'), () => go(context, 'm'), fill: false),
                ],
              ),
            ),
          ),
        ));
  }

  void go(BuildContext c, String role) => Navigator.push(
      c, MaterialPageRoute(builder: (_) => Register(role: role)));
}

class Register extends StatefulWidget {
  final String role;
  const Register({super.key, required this.role});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final name = TextEditingController();
  final age = TextEditingController();
  final region = TextEditingController();
  int? country;
  final Map<String, String> files = {};

  Future<void> pick(String k, bool video) async {
    final p = ImagePicker();
    final XFile? f = video
        ? await p.pickVideo(source: ImageSource.gallery)
        : await p.pickImage(source: ImageSource.gallery);
    if (f != null) setState(() => files[k] = f.path);
  }

  Widget tile(String k, String label, bool video) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: kLight,
              minimumSize: const Size.fromHeight(52),
              side: const BorderSide(color: kBlue, width: 2)),
          onPressed: () => pick(k, video),
          icon: Icon(files[k] != null
              ? Icons.check_circle
              : (video ? Icons.videocam : Icons.add_a_photo)),
          label: Text(label),
        ),
      );

  InputDecoration deco(String l) => InputDecoration(
      labelText: l, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));

  void submit() {
    final a = int.tryParse(age.text) ?? 0;
    final m = ScaffoldMessenger.of(context);
    if (name.text.trim().isEmpty ||
        a < 18 ||
        country == null ||
        region.text.trim().isEmpty ||
        files.length < 4) {
      m.showSnackBar(SnackBar(content: Text(tr('err'))));
      return;
    }
    m.showSnackBar(SnackBar(content: Text(tr('sent'))));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Lx(() => Scaffold(
          appBar: AppBar(
            title: Text(tr(widget.role == 'f' ? 'regF' : 'regM')),
            actions: [langBtn()],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextField(controller: name, decoration: deco(tr('name'))),
              const SizedBox(height: 12),
              TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: deco(tr('age'))),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: country,
                decoration: deco(tr('country')),
                items: [
                  for (int i = 0; i < kCountries.length; i++)
                    DropdownMenuItem(
                        value: i,
                        child: Text(kCountries[i][lang.value == 'ar' ? 0 : 1]))
                ],
                onChanged: (v) => setState(() => country = v),
              ),
              const SizedBox(height: 12),
              TextField(controller: region, decoration: deco(tr('region'))),
              const SizedBox(height: 20),
              Text(tr('verify'),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              tile('video', tr('video'), true),
              tile('id', tr('id'), false),
              tile('p1', tr('p1'), false),
              tile('p2', tr('p2'), false),
              Text(tr('noai'), style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 16),
              btn(tr('submit'), submit),
            ],
          ),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  void paywall(BuildContext c) {
    showModalBottomSheet(
      context: c,
      backgroundColor: Colors.white,
      builder: (_) => Lx(() => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('ptitle'),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(tr('pbody')),
                const SizedBox(height: 16),
                btn(tr('pay'), () => soon(c)),
                const SizedBox(height: 10),
                btn(tr('addon'), () => soon(c), fill: false),
              ],
            ),
          )),
    );
  }

  void soon(BuildContext c) {
    Navigator.pop(c);
    ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(tr('soon'))));
  }

  @override
  Widget build(BuildContext context) {
    return Lx(() => Scaffold(
          appBar: AppBar(title: Text('Marsx — ${tr('home')}'), actions: [langBtn()]),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              for (final a in [27, 31])
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: kBlue),
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: const CircleAvatar(
                        radius: 28,
                        backgroundColor: kLight,
                        child: Icon(Icons.person, color: Colors.black)),
                    title: Text('${tr('user')} · $a'),
                    subtitle: Text(tr('verified')),
                    trailing: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: kBlue, foregroundColor: Colors.black),
                      onPressed: () => paywall(context),
                      child: Text(tr('chat')),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
