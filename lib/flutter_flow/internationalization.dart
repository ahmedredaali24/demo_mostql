import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? trText = '',
  }) =>
      [enText, arText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'ptznnxj0': {
      'en': 'HOME',
      'ar': 'الرئيسية',
      'tr': 'EV',
    },
    'xbio5sl1': {
      'en': 'Nelly Kids Fashion',
      'ar': 'نيللي كيدز فاشون',
      'tr': 'Nelly Kids Fashion',
    },
    '9woaaqke': {
      'en': 'Baby and Children\'s Clothing Exhibition',
      'ar': 'معرض ملابس الطفل والبيبي',
      'tr': 'Bebek ve Çocuk Giyim Fuarı',
    },
    'f4nb5x3b': {
      'en': 'View',
      'ar': 'عرض',
      'tr': 'Görüş',
    },
    '8esi4lfs': {
      'en': 'Nilly Fabricato',
      'ar': 'نيللي فابريكاتو',
      'tr': 'Nilly Fabricato',
    },
    'ggul5148': {
      'en': 'Fabric, Yarn, Textile Accessories Fair',
      'ar': 'معرض الأقمشة والخيوط والاكسسوارات',
      'tr': 'Kumaş, İplik, Tekstil Aksesuarları Fuarı',
    },
    'qen7zumq': {
      'en': 'View',
      'ar': 'عرض',
      'tr': 'Görüş',
    },
    'a34x7om4': {
      'en': 'Moda Kids',
      'ar': 'موضة كيدز',
      'tr': 'Moda Kids',
    },
    '1cooh9d5': {
      'en': 'Moda Kids Fair for Eid',
      'ar': 'معرض موضة كيدز للعيد',
      'tr': 'Moda Kids Fuarı  Bayramı İçin',
    },
    'mc2g6x5n': {
      'en': 'View',
      'ar': 'عرض',
      'tr': 'Görüş',
    },
    'f131fv3m': {
      'en': 'HOME',
      'ar': 'الرئيسية',
      'tr': 'EV',
    },
  },
  // Nelly
  {
    'qynukmlh': {
      'en': 'Nelly Kids Fashion',
      'ar': 'نيللي كيدز  فاشون',
      'tr': 'Nelly Kids Fashion',
    },
    's6k3mxdm': {
      'en': 'Baby and Children\'s Clothing Exhibition',
      'ar': 'معرض ملابس الطفل والبيبي',
      'tr': 'Bebek ve Çocuk Giyim Fuarı',
    },
    'yjpls61h': {
      'en':
          'The largest gathering of children\'s clothing manufacturers in Egypt, Africa and the Middle East\n\nExhibition specialties:\nChildren\'s clothing of various types for all age groups.\nChildren\'s accessories (boys - girls).\nInfant supplies.\nChildren\'s room supplies.\nSportswear\nReady-made clothing production supplies.\nFabrics\nChildren\'s shoes, belts and socks\nChildren\'s beds\nShop equipment',
      'ar':
          'أكبر تجمع لمصنعي ملابس الأطفال في مصر وأفريقيا والشرق الأوسط\n\nاختصاصات المعرض:\n\nملابس أطفال بأنواعها المختلفة لجميع الفئات العمرية.\n\nإكسسوارات أطفال (أولاد - بنات).\n\nمستلزمات الأطفال الرضع.\n\nمستلزمات غرف الأطفال.\n\nملابس رياضية.\n\nمستلزمات إنتاج الملابس الجاهزة.\n\nأقمشة.\n\nأحذية وأحزمة وجوارب أطفال.\n\nأسرّة أطفال.\n\nتجهيزات المحلات التجارية.',
      'tr':
          'Mısır, Afrika ve Orta Doğu\'daki en büyük çocuk giyim üreticileri buluşması\n\nSergi özellikleri:\nHer yaş grubuna yönelik çeşitli tiplerde çocuk giyim ürünleri.\nÇocuk aksesuarları (erkek - kız).\nBebek malzemeleri.\nÇocuk odası malzemeleri.\nSpor giyim ürünleri.\nHazır giyim üretim malzemeleri.\nKumaşlar\nÇocuk ayakkabıları, kemerleri ve çorapları\nÇocuk yatakları\nMağaza ekipmanları',
    },
    'grqchlgu': {
      'en': 'Visit Invitation',
      'ar': 'زيارة المعرض',
      'tr': 'Ziyaret Davetiyesi',
    },
    'x1shzudy': {
      'en': 'Get Direction',
      'ar': 'احصل على الاتجاهات',
      'tr': 'Yol Tarifi Alın',
    },
    'fymm93zn': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'tr': 'Ev',
    },
  },
  // Menu
  {
    'u1vt7lg0': {
      'en': 'MENU',
      'ar': 'القائمة',
      'tr': 'MENÜ',
    },
    'm4ay3a3e': {
      'en': 'Hello,\nPartner of Success',
      'ar': 'مرحباً،\nشريك النجاح',
      'tr': 'Merhaba,\nBaşarı Ortağı',
    },
    'pk6l0l0q': {
      'en': 'About Us',
      'ar': 'معلومات عنا',
      'tr': 'Hakkımızda',
    },
    'z5ft3bf4': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'rc4nxn3w': {
      'en': 'Free Transportation',
      'ar': 'النقل المجاني',
      'tr': 'Ücretsiz Ulaşım',
    },
    '4uhwx7a2': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'ogo2wm9d': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'tr': 'Gizlilik Politikası',
    },
    'yyikw8ge': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'yc1blrdu': {
      'en': 'App Versions',
      'ar': 'إصدارات التطبيق',
      'tr': 'Uygulama Sürümleri',
    },
    'jsrb932r': {
      'en': 'V1.0',
      'ar': 'الإصدار 1.0',
      'tr': 'Sürüm 1.0',
    },
    'f2k6d89m': {
      'en': 'MENU',
      'ar': 'القائمة',
      'tr': 'MENÜ',
    },
  },
  // Nilly
  {
    'gy1bl0u7': {
      'en': 'Nilly Fabricato',
      'ar': 'نيللي فابريكاتو',
      'tr': 'Nilly Fabricato',
    },
    'r5yfgxdb': {
      'en': 'Fabric, Yarn, Textile Accessories Fair',
      'ar': 'معرض الأقمشة والخيوط والاكسسوارات',
      'tr': 'Kumaş, İplik, Tekstil Aksesuarları Fuarı',
    },
    '72i01bbx': {
      'en':
          'Don\'t miss the opportunity to participate in the first exhibition specialized in international and local fabrics in Egypt\n\nExhibition specialties:\nFabrics\nThreads\nKnitting threads\nClothing accessories',
      'ar':
          'لا تفوت فرصة المشاركة في أول معرض متخصص في الأقمشة العالمية والمحلية في مصر\n\nاختصاصات المعرض:\nالأقمشة\nالخيوط\nخيوط التريكو\nإكسسوارات الملابس',
      'tr':
          'Mısır\'daki uluslararası ve yerel kumaşlara odaklanan ilk sergiye katılma fırsatını kaçırmayın\n\nSergi uzmanlıkları:\nKumaşlar\nİplikler\nÖrgü iplikleri\nGiyim aksesuarları',
    },
    '2ng718c8': {
      'en': 'Visit Invitation',
      'ar': '',
      'tr': '',
    },
    'u7yis4bc': {
      'en': 'Get Direction',
      'ar': '',
      'tr': '',
    },
    '83ixkd11': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'tr': 'Ev',
    },
  },
  // Moda
  {
    'ir9nwx6m': {
      'en': 'Moda Kids',
      'ar': 'موضة كيدز',
      'tr': 'Moda Kids',
    },
    '0eccsgjy': {
      'en': 'Moda Kids Fair 4 Eid',
      'ar': 'معرض موضة كيدز للعيد',
      'tr': 'Moda Çocuk Fuarı 4 Bayram',
    },
    'afa898rv': {
      'en':
          'Now and exclusively the first exhibition specialized in children\'s clothing for export and for the Eid season\n\nExhibition specialties:\nChildren\'s clothing of various types for all age groups.\nChildren\'s accessories (boys - girls).\nInfant supplies.\nChildren\'s room supplies.\nChildren\'s shoes, belts and socks\nChildren\'s beds',
      'ar':
          'الآن وحصريا أول معرض متخصص في ملابس الأطفال للتصدير ولموسم العيد\n\nاختصاصات المعرض:\nملابس أطفال بأنواعها المختلفة لجميع الفئات العمرية.\nإكسسوارات أطفال (أولاد - بنات).\nمستلزمات الأطفال الرضع.\nمستلزمات غرف الأطفال.\nأحذية وأحزمة وجوارب أطفال.\nأسرّة أطفال',
      'tr':
          'Şimdi ve sadece ihracat ve bayram sezonu için çocuk giyimine odaklanan ilk sergi\n\nSergi özellikleri:\nHer yaş grubuna yönelik çeşitli tiplerde çocuk giyimi.\nÇocuk aksesuarları (erkek - kız).\nBebek malzemeleri.\nÇocuk odası malzemeleri.\nÇocuk ayakkabıları, kemerleri ve çorapları\nÇocuk yatakları',
    },
    'tb9zn6n2': {
      'en': 'Visit Invitation',
      'ar': '',
      'tr': '',
    },
    '3dl2kt03': {
      'en': 'Get Direction',
      'ar': '',
      'tr': '',
    },
    'ojrletvw': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'tr': 'Ev',
    },
  },
  // AboutUs
  {
    'ako4t7id': {
      'en': 'Plateau Market',
      'ar': 'بلاتو ماركت',
      'tr': 'Plateau Market',
    },
    '9mu9il1t': {
      'en': 'Exhibitions and Conferences & Export',
      'ar': 'لتنظيم المعارض والمؤتمرات والتصدير',
      'tr': 'Sergiler ve Konferanslar & İhracat',
    },
    '3z8ffrmn': {
      'en':
          'Specialized in organizing and managing international exhibitions and conferences, combining innovation and professionalism to deliver events that leave a lasting impact across various sectors. The company is proud to organize the “Nelly Kids Fashion” exhibition, which focuses on the latest trends in children’s and infants’ clothing, reinforcing its position as a leader in this field.\nIn addition, the company organizes the “Nelly Fabricato” exhibition, the first exhibition in Egypt dedicated to international and local fabrics, bringing together major suppliers and manufacturers from all over the world to meet the needs of both the Egyptian and global markets.\nIt also organizes the “Moda Kids” exhibition, which is the first exhibition specialized in children’s clothing for export and the Eid season, which enhances the company’s position as a leader in the children’s clothing sector at the local and international levels.',
      'ar':
          'متخصصة في تنظيم وإدارة المعارض والمؤتمرات الدولية، تجمع بين الابتكار والاحترافية لتقديم فعاليات تترك أثراً دائماً في مختلف القطاعات. وتفخر الشركة بتنظيم معرض \"نيللي كيدز فاشون\" الذي يركز على أحدث صيحات ملابس الأطفال والرضع، مما يعزز مكانتها كرائدة في هذا المجال.\nبالإضافة إلى ذلك، تنظم الشركة معرض \"نيللي فابريكاتو\"، وهو أول معرض في مصر مخصص للأقمشة العالمية والمحلية، ويجمع كبار الموردين والمصنعين من جميع أنحاء العالم لتلبية احتياجات السوق المصرية والعالمية.\nكما تنظم معرض \"مودا كيدز\"، وهو أول معرض متخصص في ملابس الأطفال للتصدير وموسم العيد، مما يعزز مكانة الشركة كرائدة في قطاع ملابس الأطفال على المستوى المحلي والدولي.',
      'tr':
          'Uluslararası sergiler ve konferanslar düzenleme ve yönetme konusunda uzmanlaşmış, çeşitli sektörlerde kalıcı etki bırakan etkinlikler sunmak için yenilikçilik ve profesyonelliği bir araya getiriyor. Şirket, çocuk ve bebek giyimindeki son trendlere odaklanan ve bu alanda lider konumunu güçlendiren \"Nelly Kids Fashion\" sergisini düzenlemekten gurur duyuyor. \nAyrıca şirket, uluslararası ve yerel kumaşlara adanmış Mısır\'daki ilk sergi olan \"Nelly Fabricato\" sergisini düzenliyor ve hem Mısır hem de küresel pazarların ihtiyaçlarını karşılamak için dünyanın dört bir yanından büyük tedarikçileri ve üreticileri bir araya getiriyor. \nAyrıca, ihracat ve bayram sezonu için çocuk giyimine odaklanan ilk sergi olan \"Moda Kids\" sergisini düzenliyor ve şirketin yerel ve uluslararası düzeyde çocuk giyim sektöründe lider konumunu güçlendiriyor.',
    },
    'z9t019zp': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'tr': 'Ev',
    },
  },
  // FreeTransportation
  {
    'i316qfhd': {
      'en': 'FREE TRANSPORTATION',
      'ar': 'النقل المجاني',
      'tr': 'ÜCRETSİZ ULAŞIM',
    },
    'y18ajoun': {
      'en':
          'In order to facilitate the arrival of visitors to our exhibitions, free transportation service has been provided to most governorates of Egypt\n\nExhibitions are for commercial contracts only and there is no retail sale\n\nExhibitions are organized by:\nAl-Tareq Company ®️ and Plateau Market Company\n\nFor reservations and inquiries regarding free transportation, please contact the following number from 10 am to 7 pm',
      'ar':
          'لتسهيل وصول الزوار لمعارضنا تم توفير خدمة النقل المجاني لمعظم محافظات مصر\n\nالمعارض للعقود التجارية فقط ولا يوجد بيع بالتجزئة\n\nيتم تنظيم المعارض من قبل:\n\nشركة الطارق ®️ وشركة بلاتو ماركت\n\nللحجز والاستفسار بخصوص النقل المجاني يرجى الاتصال بالرقم التالي من الساعة 10 صباحًا حتى 7 مساءًا',
      'tr':
          'Sergilerimize gelen ziyaretçilerin ulaşımını kolaylaştırmak için Mısır\'ın çoğu vilayetine ücretsiz ulaşım hizmeti sağlanmıştır\n\nSergiler yalnızca ticari sözleşmeler içindir ve perakende satış yoktur\n\nSergiler şunlar tarafından organize edilmektedir:\nAl-Tareq Company ®️ ve Plateau Market Company\n\nÜcretsiz ulaşımla ilgili rezervasyon ve sorularınız için lütfen aşağıdaki numarayı sabah 10\'dan akşam 7\'ye kadar arayın',
    },
    'ysrpze0e': {
      'en': '01002144616',
      'ar': '01002144616',
      'tr': '01002144616',
    },
    'idb5n99a': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'tr': 'Ev',
    },
  },
  // Miscellaneous
  {
    '82z7i46b': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'p2h820b8': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'v2cxoi55': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'xd2fvn1v': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '03egntd7': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '36lza1i8': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '8tzen5d3': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'vg2ymasq': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'sxmfjgiv': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'r7i2lgsh': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '2haaxinc': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '3hmkz472': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '5wvn82kg': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'pvvydse7': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '6v8rg38z': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'vwdu473f': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'ynrd0e6b': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '4cf1rxg2': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'tg040dbn': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'dur2j9p5': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '6kgd43s1': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'rg7yyz3k': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'nx3b9bh9': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    'v0ivi0y1': {
      'en': '',
      'ar': '',
      'tr': '',
    },
    '1nec0ttr': {
      'en': '',
      'ar': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
