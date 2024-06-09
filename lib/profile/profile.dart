import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/button_widget.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/login/password_toggle_text_field.dart';

class ProfilePage extends StatelessWidget with ScreenSizeUtil {
  // final TextEditingController nameController;
  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profNameController = TextEditingController();
    final profEmailController = TextEditingController();
    final profPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Profile',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.1
                    //  Color(0xff252836),
                    ),
                color: const Color(0xff1F1D2B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'email@gmail.com',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffB1B1B1),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // String newName = nameController.text;
                      // String newEmail = emailController.text;
                      // String newPassword = passwordController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile updated successfully'),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Edit.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              style: const TextStyle(
                color: Color(0xffEBEBEF),
              ),
              controller: profNameController,
              decoration: InputDecoration(
                labelText: 'Full name',
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEBEBEF),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(context) * 0.0259),
              child: TextField(
                style: const TextStyle(
                  color: Color(0xffEBEBEF),
                ),
                controller: profEmailController,
                decoration: InputDecoration(
                  labelText: 'Email Adress',
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffEBEBEF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            PasswordToggleTextField(
              Controller: profPasswordController,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(context) * 0.0259),
              child: ButtonWidget(
                buttonName: 'Save changes',
                functionApply: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: Colors.white),
                color: const Color(0xff1F1D2B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'More',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text(
                      'Legal and policy',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPage(),
                          ));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: Color.fromARGB(255, 63, 68, 91),
                      height: 1,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text(
                      'Помощь и обратная связь',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 30),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Text(''),
                          ));
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: Color.fromARGB(255, 63, 68, 91),
                      height: 1,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text(
                      'About us',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUsPage(),
                          ));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(
                    color: Color(0xff12CDD9),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xfff1f1d2b),
                ),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Выйти',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff12CDD9),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPage extends StatelessWidget with ScreenSizeUtil {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Политика конфиденциальности',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff1F1D2B),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        leading: Padding(
          padding: EdgeInsets.only(
              left: getWidth(context) * 0.054, top: getHeight(context) * 0.019),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xff252836),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Text(
            '''Политика конфиденциальности Movies NOW!

Введение

Добро пожаловать! Вы используете приложение Movies NOW! (далее – «Приложение»), предоставляемое компанией FlickDirect Inc (далее – «мы», «нас» или «наш»). В данной Политике конфиденциальности описывается информация, которую мы собираем о вас в Приложении, как мы используем и раскрываем эту информацию, а также меры, которые мы принимаем для ее защиты. Используя Приложение, вы соглашаетесь с практиками конфиденциальности, описанными в данной политике.

Собираемая информация

Мы можем собирать и получать информацию о пользователях нашего Приложения непосредственно от этих пользователей, от наших веб-серверов, от третьих сторон (таких как поставщики) или комбинацией этих методов. Эта информация может включать Персональные данные, которые могут быть использованы для индивидуальной идентификации вас (такие как ваше имя, электронная почта, номер телефона), и Неперсональные данные, которые включают всю остальную информацию.

Использование персональных данных

Мы используем Персональные данные для внутренних и операционных целей, таких как предоставление, улучшение и персонализация наших услуг, разработка новых, а также для защиты нашего Приложения и пользователей. Мы также используем ваши Персональные данные для связи с вами, например, информирования вас о вашем аккаунте и обновлениях безопасности. Если вы зарегистрировались для получения услуги, мы будем, с вашего разрешения, использовать ваши Персональные данные для отправки вам маркетинговых сообщений.

Основания для обработки и последствия

Для обработки ваших Персональных данных мы опираемся на следующие юридические основания:

- Для выполнения контракта: мы используем ваши Персональные данные для предоставления вам наших услуг и соблюдения наших Условий обслуживания.
- С вашего согласия: мы можем использовать ваши Персональные данные, если вы дали нам явное разрешение на это для определенной цели.
- Для законных интересов: мы можем использовать ваши Персональные данные, если у нас есть законные основания для этого.

Добровольное раскрытие

Любая информация или контент, который вы добровольно раскрываете для размещения в Приложении, такой как Пользовательский контент, становится доступным для общественности. Пользовательский контент включает, но не ограничивается, обзоры, комментарии и фотографии.

Ваши права

Статья 501.171 Флоридского статута, Охрана конфиденциальной личной информации, предоставляет определенные права на конфиденциальность жителям Флориды. Если вы являетесь жителем Флориды, у вас есть право запрашивать у компании информацию о том, какие персональные данные она собирает, использует, раскрывает и хранит. Вы имеете следующие права:

- Право знать, какие Персональные данные собираются о вас.
- Право знать, раскрываются ли ваши Персональные данные и кому.
- Право доступа к вашим Персональным данным.
- Право, при определенных обстоятельствах, удалять информацию, которую мы собрали о вас.
- Право запрашивать исправление любых неточных Персональных данных, которые мы собрали о вас.

Категории Персональных данных, которые мы собрали о вас.

Категории источников, из которых были собраны Персональные данные.

Цель сбора Персональных данных.

Категории третьих сторон, с которыми мы поделились вашими Персональными данными.

Конкретные части Персональных данных, которые мы собрали о вас.

Если мы раскрыли ваши Персональные данные третьим сторонам для деловой цели за последние 12 месяцев, мы укажем категории Персональных данных, переданных каждой категории третьих сторон. Если мы раскрыли ваши Персональные данные за последние 12 месяцев, мы укажем категории Персональных данных, раскрытых каждой категории третьих сторон.

Удаление

Вы имеете право запрашивать удаление Персональных данных, которые мы собрали о вас. Это право подлежит определенным исключениям: например, нам может понадобиться сохранить ваши Персональные данные для предоставления вам Услуг или завершения транзакции или другого действия, которое вы запросили. Если ваш запрос на удаление подпадает под одно из этих исключений, мы можем отклонить ваш запрос на удаление.

Исправление

Вы имеете право запрашивать исправление любых неточных Персональных данных, которые мы собрали о вас.

Осуществление ваших прав

Для осуществления вышеописанных прав вы или ваш Уполномоченный агент (определенный ниже) должны отправить нам запрос, который (1) предоставляет достаточную информацию, позволяющую нам убедиться, что вы являетесь лицом, о котором мы собрали Персональные данные, и (2) описывает ваш запрос достаточно подробно, чтобы мы могли его понять, оценить и ответить на него. Каждый запрос, который соответствует обоим этим критериям, будет считаться «Действительным запросом». Мы можем не отвечать на запросы, которые не соответствуют этим критериям. Мы будем использовать Персональные данные, предоставленные в Действительном запросе, только для проверки вашей личности и выполнения вашего запроса. Вам не нужен аккаунт для подачи Действительного запроса.

Мы будем стараться ответить на ваш Действительный запрос в течение 45 дней с момента получения. Мы не будем взимать с вас плату за подачу Действительного запроса, если только ваш(и) Действительный(ые) запрос(ы) не являются чрезмерными, повторяющимися или явно необоснованными. Если мы определим, что ваш Действительный запрос требует платы, мы уведомим вас об этом и объясним это решение до выполнения вашего запроса.

Вы можете подать Действительный запрос следующими способами:

Напишите нам по электронной почте: connect@flickdirect.com

Вы также можете уполномочить агента (далее – «Уполномоченный агент») на осуществление ваших прав от вашего имени. Для этого вы должны предоставить вашему Уполномоченному агенту письменное разрешение на осуществление ваших прав от вашего имени, и мы можем запросить копию этого письменного разрешения у вашего Уполномоченного агента, когда он сделает запрос от вашего имени.

Продажа персональных данных

Мы не будем продавать ваши Персональные данные и не делали этого за последние 12 месяцев.

Обмен персональными данными

Мы не будем делиться вашими Персональными данными для целей стороннего маркетинга или для любых целей, не явно согласованных вами, и не делали этого за последние 12 месяцев. Мы не делимся Персональными данными несовершеннолетних до 16 лет без явного согласия родителей.

Мы не будем дискриминировать вас за осуществление ваших прав

Мы не будем дискриминировать вас за осуществление ваших прав в соответствии с законами о конфиденциальности Флориды. Мы не будем отказывать вам в наших товарах или услугах, взимать с вас другие цены или тарифы, или предоставлять вам товары и услуги более низкого качества, если вы осуществляете свои права в соответствии с законами о конфиденциальности Флориды. Однако мы можем предлагать различные уровни Movies NOW!, разрешенные действующими законами о конфиденциальности данных, с различными ценами, тарифами или уровнями качества товаров и услуг, которые вы получаете, в зависимости от стоимости Персональных данных, которые мы получаем от вас.

Права на конфиденциальность в соответствии с законами других штатов

Права жителей Невады

Если вы являетесь резидентом Невады, у вас есть право отказаться от продажи определенных Персональных данных третьим сторонам, которые намерены лицензировать или продавать эти Персональные данные. Вы можете осуществить это право, связавшись с нами по адресу connect@flickdirect.com с темой письма "Nevada Do Not Sell Request" и предоставив нам ваше имя и адрес электронной почты, связанный с вашим аккаунтом. Обратите внимание, что в настоящее время мы не продаем ваши Персональные данные, как это определяется в Главе 603A Пересмотренных статутов Невады.''',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget with ScreenSizeUtil {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff1F1D2B),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        leading: Padding(
          padding: EdgeInsets.only(
              left: getWidth(context) * 0.054, top: getHeight(context) * 0.019),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xff252836),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text(
              'Contact Information',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              '''
If you have any questions or comments about this Privacy Policy, the ways in which we collect and use your Personal Data or your choices and rights regarding such collection and use, please do not hesitate to contact us at:
      
      Email: movieapps@gmail.com
      
      Address: Uzbekistan Fergana city
      S.Temur st 64
      
      DATE OF LAST UPDATE: May 14th, 202s''',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
