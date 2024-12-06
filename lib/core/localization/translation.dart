import 'package:ecommerce_app/core/localization/strings_keys.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "lang": "اختر اللغة",
          "next": "التالي",
          "lanA": "العربية",
          "lanE": "الانجليزية",
          "choose_product": "اختر المنتج",
          "easy_payment": "دفع سهل وآمن",
          StringsKeys.trackOrder: "أتبع طلبك",
          StringsKeys.fastDelivery: "توصيل سريع",
          StringsKeys.productDescription:
              "لدينا منتجات 100k +. اختر منتجك\n من متجرنا للتجارة الإلكترونية.",
          StringsKeys.paymentDescription:
              "طريقة دفع سهلة وآمنة.\n موثوق به من قبل عملائنا من\n جميع أنحاء العالم.",
          StringsKeys.trackDescription:
              "تم استخدام أفضل أداة تعقب لتتبع طلبك.\n ستعرف مكان وجود منتجك في\n الوقت الحالي.",
          StringsKeys.deliveryDescription:
              "موثوقة وسرعة التسليم.\n نقوم بتسليم منتجك بأسرع طريقة ممكنة.",
          StringsKeys.email: "البريد الالكتروني",
          StringsKeys.enterEmail: "أدخل بريدك الإلكتروني",
          StringsKeys.password: "كلمة المرور",
          StringsKeys.enterPassword: "أدخل كلمة المرور",
          StringsKeys.forgotPassword: "هل نسيت كلمة السر",
          StringsKeys.signIn: "تسجيل الدخول",
          StringsKeys.signUp: "تسجيل",
          StringsKeys.dontHaveAccount: " ليس لديك حساب ؟",
          StringsKeys.passwordRecovery: "استرجاع كلمة المرور",
          StringsKeys.verifyEmail: "التأكد من البريد الإلكتروني",
          StringsKeys.emailVerificationDescription:
              "أدخل عنوان البريد الإلكتروني المرتبط بالحساب.",
          StringsKeys.verifyCode: "التحقق من الكود",
          StringsKeys.enterCode:
              "أدخل الرمز المكون من 6 أرقام الذي أرسلناه إلى عنوان بريدك الإلكتروني:",
          StringsKeys.verificationCode: "رمز التحقق",
          StringsKeys.createAccount: "تسجيل حساب جديد",
          StringsKeys.createAccountDescription:
              "الرجاء إدخال المعلومات لإنشاء حساب",
          StringsKeys.name: "الأسم",
          StringsKeys.enterFullName: "أدخل اسمك كامل",
          StringsKeys.phone: "الجوال",
          StringsKeys.enterPhone: "ادخل رقمك",
          StringsKeys.hasAccount: "هل لديك حساب ؟",
          StringsKeys.resetPassword: "إعادة تعيين كلمة المرور",
          StringsKeys.newPassword: "كلمة السر الجديدة",
          StringsKeys.enterNewPassword: "أدخل كلمة المرور الجديدة.",
          StringsKeys.confirmPassword: "تأكيد كلمة المرور",
          StringsKeys.accountCreated: "تم إنشاء الحساب بنجاح",
          StringsKeys.save: "حفظ",
          StringsKeys.emailForVerification:
              "الرجاء إدخال عنوان بريدك الإلكتروني لتلقي رمز التحقق",
          StringsKeys.check: "فحص",
          StringsKeys.checkEmail: "فحص البريد الإلكتروني",
          StringsKeys.success: "نجاح",
          StringsKeys.congratulations: "تهانينا !",
          StringsKeys.registeredSuccessfully: "تم تسجيلك بنجاح",
          StringsKeys.done: "إنهاء",
          StringsKeys.confirmExit: "هل انت متأكد انك تريد الخروج ؟",
          StringsKeys.goToLogin: "الذهاب لتسجيل الدخول",
          StringsKeys.passwordResetSuccess: "تم اعادة تعيين كلمة المرور بنجاح",
          StringsKeys.categories: "الاصناف",
          StringsKeys.products: "المنتجات",
          StringsKeys.offers: "تقدم لك",
          StringsKeys.home: "الرئيسية",
          StringsKeys.favorite: "المفضلة",
          StringsKeys.person: "شخص",
          StringsKeys.settings: "الاعدادات",
          StringsKeys.welcomeBack: "مرحبا بعودتك",
          StringsKeys.rememberMe: "تذكرني",
          StringsKeys.send: "ارسال",
          StringsKeys.welcomeStartJourney:
              "ابدأ رحلتك معنا الآن عن طريق إنشاء حسابك.",
          StringsKeys.signInWithEmail:
              "تسجيل الدخول باستخدام بريدك الإلكتروني\n وكلمة المرور أو المتابعة باستخدام وسائل التواصل الاجتماعي",
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
          "usernameRequired": "يرجى إدخال اسمك الكامل",
          "phoneRequired": "يرجى إدخال رقم الجوال",
          "emailRequired": "يرجى إدخال البريد الإلكتروني",
          "passwordRequired": "يرجى إدخال كلمة المرور",
          "confirmPasswordRequired": "يرجى إدخال تاكيد كلمة المرور",
          "create_new_account": "إنشاء حساب جديد",
          "seeAll": "اظهار الكل",
        },
        "en": {
          StringsKeys.lang: "Choose Language",
          StringsKeys.next: "Next",
          StringsKeys.langArabic: "Arabic",
          StringsKeys.langEnglish: "English",
          StringsKeys.chooseProduct: "Choose Product",
          StringsKeys.easyPayment: "Easy And Safe Payment",
          StringsKeys.trackOrder: "Track Your Order",
          StringsKeys.fastDelivery: "Fast Delivery",
          StringsKeys.productDescription:
              "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
          StringsKeys.paymentDescription:
              "Easy Checkout & Safe Payment\n method. Trusted by our Customers\n from all over the world.",
          StringsKeys.trackDescription:
              "Best Tracker has been Used For\n Track your order. You'll know where\n your product is at the moment.",
          StringsKeys.deliveryDescription:
              "Reliable And Fast Delivery. We\nDeliver your product the fastest\nway possible.",
          StringsKeys.email: "Email",
          StringsKeys.enterEmail: "Enter Your Email",
          StringsKeys.password: "Password",
          StringsKeys.enterPassword: "Enter Your Password",
          StringsKeys.forgotPassword: "Forgot Password",
          StringsKeys.signIn: "Sign In",
          StringsKeys.signUp: "Sign Up",
          StringsKeys.dontHaveAccount: "Don't have an account? ",
          StringsKeys.passwordRecovery: "Password Recovery",
          StringsKeys.verifyEmail: "Check Email",
          StringsKeys.emailVerificationDescription:
              "Enter the email address associated with account.",
          StringsKeys.verifyCode: "Check Code",
          StringsKeys.enterCode:
              "Enter the 6-digit code we sent to your email address:",
          StringsKeys.verificationCode: "Verification Code",
          StringsKeys.createAccount: "Create Your Account",
          StringsKeys.createAccountDescription:
              "Please enter info to create account",
          StringsKeys.name: "Name",
          StringsKeys.enterFullName: "Enter your full name",
          StringsKeys.phone: "Phone",
          StringsKeys.enterPhone: "Enter your phone",
          StringsKeys.hasAccount: "Do you have an account?",
          StringsKeys.resetPassword: "Reset Password",
          StringsKeys.newPassword: "New Password",
          StringsKeys.enterNewPassword: "Enter your New Password.",
          StringsKeys.confirmPassword: "Confirm Password",
          StringsKeys.accountCreated: "Account successfully created",
          StringsKeys.save: "Save",
          StringsKeys.emailForVerification:
              "Please Enter your Email Address To Receive A Verification Code",
          StringsKeys.check: "Check",
          StringsKeys.checkEmail: "Check Email",
          StringsKeys.success: "Success",
          StringsKeys.congratulations: "Congratulations!",
          StringsKeys.registeredSuccessfully: "Successfully Registered",
          StringsKeys.done: "Done",
          StringsKeys.confirmExit: "Are you sure you want to exit?",
          StringsKeys.goToLogin: "Go To Login",
          StringsKeys.passwordResetSuccess:
              "Password has been reset successfully",
          StringsKeys.categories: "Categories",
          StringsKeys.products: "Product for You",
          StringsKeys.offers: "Offer for You",
          StringsKeys.home: "Home",
          StringsKeys.favorite: "Favorite",
          StringsKeys.person: "Person",
          StringsKeys.settings: "Settings",
          StringsKeys.welcomeBack: "Welcome Back",
          StringsKeys.welcomeStartJourney:
              "Start your journey with us now by creating your account.",
          StringsKeys.signInWithEmail:
              "Sign in with your email and password\nor continue with social media",
          StringsKeys.rememberMe: "Remember Me",
          StringsKeys.send: "send",
          "fieldEmpty": "Field can't be empty",
          "inputTooShort": "Input can't be less than 8 characters",
          "inputTooLong": "Input can't be more than 100 characters",
          "invalidUsername":
              "Invalid username. It should only contain alphanumeric characters or underscores",
          "invalidEmail": "Invalid email address. Please enter a valid email",
          "invalidPhone":
              "Invalid phone number. Please enter a valid phone number",
          "passwordTooShort": "Password must be at least 8 characters",
          "passwordUppercase":
              "Password must include at least one uppercase letter",
          "passwordLowercase":
              "Password must include at least one lowercase letter",
          "passwordDigit": "Password must include at least one digit",
          "usernameRequired": "Please enter your full name",
          "phoneRequired": "Please enter your phone number",
          "emailRequired": "Please enter your email",
          "passwordRequired": "Please enter your password",
          "confirmPasswordRequired": "Please enter confirm password",
          "create_new_account": "Create New Account",
          "seeAll": "See All",
        },
      };
}
