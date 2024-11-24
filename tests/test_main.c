// File: tests/test_main.c

#include <check.h>
#include "../main.c"

START_TEST(test_example)
{
    // Simple example test, replace with real tests
    ck_assert_int_eq(1 + 1, 2); // Basic math test
}
END_TEST

Suite *main_suite(void)
{
    Suite *s;
    TCase *tc_core;

    s = suite_create("Main");
    tc_core = tcase_create("Core");

    tcase_add_test(tc_core, test_example);
    suite_add_tcase(s, tc_core);

    return s;
}

int main(void)
{
    int number_failed;
    Suite *s;
    SRunner *sr;

    s = main_suite();
    sr = srunner_create(s);

    srunner_run_all(sr, CK_NORMAL);
    number_failed = srunner_ntests_failed(sr);
    srunner_free(sr);

    return (number_failed == 0) ? 0 : 1;
}
