import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "lang": "اختر اللغة",
          "next": "التالي",
          "langArabic": "العربية",
          "langEnglish": "الانجليزية",
          "choose_product": "اختر المنتج",
          "easy_payment": "دفع سهل وآمن",
          "track_order": "أتبع طلبك",
          "fast_delivery": "توصيل سريع",
          "product_description":
              "لدينا منتجات 100k +. اختر منتجك\n من متجرنا للتجارة الإلكترونية.",
          "payment_description":
              "طريقة دفع سهلة وآمنة.\n موثوق به من قبل عملائنا من\n جميع أنحاء العالم.",
          "track_description":
              "تم استخدام أفضل أداة تعقب لتتبع طلبك.\n ستعرف مكان وجود منتجك في\n الوقت الحالي.",
          "delivery_description":
              "موثوقة وسرعة التسليم.\n نقوم بتسليم منتجك بأسرع طريقة ممكنة.",
          "email": "البريد الالكتروني",
          "enter_email": "أدخل بريدك الإلكتروني",
          "password": "كلمة المرور",
          "enter_password": "أدخل كلمة المرور",
          "forgot_password": "هل نسيت كلمة السر",
          "sign_in": "تسجيل الدخول",
          "sign_up": "تسجيل",
          "welcomeStartJourney": "ابدأ رحلتك معنا الآن عن طريق إنشاء حسابك.",
          "dont_have_account": "ليس لديك حساب؟",
          "password_recovery": "استرجاع كلمة المرور",
          "verify_email": "التأكد من البريد الإلكتروني",
          "email_verification_description":
              "أدخل عنوان البريد الإلكتروني المرتبط بالحساب.",
          "verify_code": "التحقق من الكود",
          "enter_code": "الرجاء إدخال رمز الرقم المرسل إليك",
          "verification_code": "رمز التحقق",
          "create_account": "تسجيل حساب جديد",
          "create_account_description": "الرجاء إدخال المعلومات لإنشاء حساب",
          "name": "الأسم",
          "enter_full_name": "أدخل اسمك كامل",
          "phone": "الجوال",
          "enter_phone": "ادخل رقمك",
          "has_account": "هل لديك حساب؟",
          "reset_password": "إعادة تعيين كلمة المرور",
          "new_password": "كلمة السر الجديدة",
          "enter_new_password": "أدخل كلمة المرور الجديدة.",
          "confirm_password": "تأكيد كلمة المرور",
          "account_created": "تم إنشاء الحساب بنجاح",
          "rememberMe": "تذكرني",
          "save": "حفظ",
          "email_for_verification":
              "الرجاء إدخال عنوان بريدك الإلكتروني لتلقي رمز التحقق",
          "check": "فحص",
          "check_email": "فحص البريد الإلكتروني",
          "success": "نجاح",
          "congratulations": "تهانينا !",
          "registered_successfully": "تم تسجيلك بنجاح",
          "done": "إنهاء",
          "confirm_exit": "هل انت متأكد انك تريد الخروج؟",
          "go_to_login": "الذهاب لتسجيل الدخول",
          "password_reset_success": "تم اعادة تعيين كلمة المرور بنجاح",
          "welcome_back": "مرحبا بعودتك",
          "signInWithEmail":
              "تسجيل الدخول باستخدام بريدك الإلكتروني\n وكلمة المرور أو المتابعة باستخدام وسائل التواصل الاجتماعي",
          "send": "إرسال",
          "fieldEmpty": "لا يمكن أن يكون الحقل فارغًا",
          "inputTooShort": "لا يمكن أن يكون الإدخال أقل من 8 أحرف",
          "inputTooLong": "لا يمكن أن يكون الإدخال أكثر من 100 حرف",
          "invalidUsername":
              "اسم المستخدم غير صالح. يجب أن يحتوي فقط على أحرف أبجدية أو أرقام أو شرطة سفلية",
          "invalidEmail":
              "عنوان البريد الإلكتروني غير صالح. الرجاء إدخال بريد إلكتروني صالح",
          "invalidPhone": "رقم الهاتف غير صالح. الرجاء إدخال رقم هاتف صالح",
          "passwordTooShort":
              "يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل",
          "passwordUppercase":
              "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل",
          "passwordLowercase":
              "يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل",
          "passwordDigit": "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل",
          "categories": "الأصناف",
          "products": "المنتجات",
          "offers": "العروض",
          "home": "الرئيسية",
          "favorite": "المفضلة",
          "person": "شخصي",
          "settings": "الإعدادات"
        },
        "en": {
          "lang": "Choose Language",
          "next": "Next",
          "langArabic": "Arabic",
          "langEnglish": "English",
          "choose_product": "Choose Product",
          "easy_payment": "Easy And Safe Payment",
          "track_order": "Track Your Order",
          "fast_delivery": "Fast Delivery",
          "product_description":
              "We Have a 100k Product. Choose your product from our e-commerce shop.",
          "payment_description":
              "Easy Checkout & Safe Payment method. Trusted by our customers from all over the world.",
          "track_description":
              "Best Tracker has been used to track your order. You'll know where your product is at the moment.",
          "delivery_description":
              "Reliable and fast delivery. We deliver your product the fastest way possible.",
          "email": "Email",
          "enter_email": "Enter Your Email",
          "password": "Password",
          "enter_password": "Enter Your Password",
          "forgot_password": "Forgot Password",
          "sign_in": "Sign In",
          "sign_up": "Sign Up",
          "welcomeStartJourney":
              "Start your journey with us now by creating your account.",
          "dont_have_account": "Don't have an account?",
          "password_recovery": "Password Recovery",
          "verify_email": "Verify Email",
          "email_verification_description":
              "Enter the email address associated with your account.",
          "verify_code": "Verify Code",
          "enter_code":
              "Please enter the verification code sent to your email.",
          "verification_code": "Verification Code",
          "create_account": "Create Your Account",
          "create_account_description":
              "Please enter the required information to create your account.",
          "name": "Name",
          "enter_full_name": "Enter Your Full Name",
          "phone": "Phone",
          "enter_phone": "Enter Your Phone Number",
          "has_account": "Already have an account?",
          "reset_password": "Reset Password",
          "new_password": "New Password",
          "enter_new_password": "Enter Your New Password.",
          "confirm_password": "Confirm Password",
          "account_created": "Account Successfully Created",
          "rememberMe": "Remember Me",
          "save": "Save",
          "email_for_verification":
              "Please enter your email address to receive a verification code.",
          "check": "Check",
          "check_email": "Check Your Email",
          "success": "Success",
          "congratulations": "Congratulations!",
          "registered_successfully": "Successfully Registered",
          "done": "Done",
          "confirm_exit": "Are you sure you want to exit?",
          "go_to_login": "Go to Login",
          "password_reset_success": "Password Reset Successfully",
          "welcome_back": "Welcome Back",
          "signInWithEmail":
              "Sign in with your email and password or continue with social media.",
          "send": "Send",
          "fieldEmpty": "Field can't be empty",
          "inputTooShort": "Input can't be less than 8 characters",
          "inputTooLong": "Input can't be more than 100 characters",
          "invalidUsername":
              "Invalid username. It should only contain alphanumeric characters or underscores.",
          "invalidEmail": "Invalid email address. Please enter a valid email.",
          "invalidPhone":
              "Invalid phone number. Please enter a valid phone number.",
          "passwordTooShort": "Password must be at least 8 characters long.",
          "passwordUppercase":
              "Password must include at least one uppercase letter.",
          "passwordLowercase":
              "Password must include at least one lowercase letter.",
          "passwordDigit": "Password must include at least one digit.",
          "categories": "Categories",
          "products": "Products",
          "offers": "Offers",
          "home": "Home",
          "favorite": "Favorite",
          "person": "Profile",
          "settings": "Settings"
        },
      };
}
