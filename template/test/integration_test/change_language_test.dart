import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{PROJECT_NAME}}/app/enums/http_call.dart';
import 'package:{{PROJECT_NAME}}/app/repositories/clients/client_response.dart';
import 'package:{{PROJECT_NAME}}/app/repositories/repositories/auth/models/auth_session.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockHttpClient client;

  setUp(() {
    client = MockHttpClient();
  });

  testWidgets('Change Language', (WidgetTester tester) async {
    await pumpAppWithMocks(tester, client);

    expect(find.text('Login'), findsNothing);
    expect(find.text('Inicio de sesión'), findsOne);

    await tester.tap(find.byKey(Key('dropdown_languages')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('dropdown_languages_en')).last);
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOne);
    expect(find.text('Inicio de sesión'), findsNothing);

    when(
      () => client.call<AuthSession, AuthSession>(
        any(),
        method: HttpCall.POST,
        data: any(named: 'data'),
        queryParameters: any(named: 'queryParameters'),
        tokenRequired: any(named: 'tokenRequired'),
      ),
    ).thenAnswer(
      (_) async => ClientResponse(
        data: AuthSession(accessToken: 'access', refreshToken: 'refresh'),
        isError: false,
      ),
    );

    await tester.enterText(find.byKey(Key('login_email_textfield')), 'login');
    await tester.enterText(find.byKey(Key('login_password_textfield')), 'pass');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('login_button')));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOne);
    expect(find.text('Logged in'), findsOne);
  });
}
