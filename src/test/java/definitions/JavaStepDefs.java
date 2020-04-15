package definitions;

import cucumber.api.java.en.Given;

import java.util.Arrays;

public class JavaStepDefs {
    private Object String;

    @Given("I want to print {string} and {string} in console")
    public void iWantToPrintAndInConsole(String str1, String str2) {
        System.out.println("String1: " + str1 + "\n" + "String2: " + str2);
    }

    @Given("I perform actions with {string} and {string}")
    public void iPerformActionsWithAnd(String str1, String str2) {
        System.out.println("Uppercase for String2: " + str2.toUpperCase());
        System.out.println("Length for String1: " + str1.length());
        System.out.println("concatenation of " + str1 + " and " + str2 + ": " + str1.concat(str2));
        System.out.println("comparision of both strings: " + str1.equalsIgnoreCase(str2));
        System.out.println("Partial comparision for " + str1 + ": " + str1.contains("ranGe"));
        System.out.println("Partial comparision for " + str2 + ": " + str2.contains("ran"));
        System.out.println("Comparison of two objects: " + (str1 != str2));
    }

    @Given("I perform action with {int} and {int}")
    public void iPerformActionWithAnd(int arg0, int arg1) {
        int division = arg0 / arg1;
        System.out.println("Division result of " + arg0 + " and " + arg1 + " is: " + division);

        int num1 = 20;
        int num2 = 3;
        int sum = num1 + num2;
        int diff = num1 - num2;
        System.out.println("Two numbers are: " + num1 + " and " + num2);
        System.out.println("Sum: " + sum);
        System.out.println("Difference: " + diff);
    }

    @Given("I perform boolean actions with {string} and {string}")
    public void iPerformBooleanActionsWithAnd(String str1, String str2) {
        if (str1.equalsIgnoreCase(str2)) {
            System.out.println("Strings are same");
        } else {
            System.out.println("String doesn't match");
        }
    }

    @Given("I print URL for  {string} page")
    public void iPrintURLForPage(String site) {
        System.out.println("I print url for 'Facebook' page --> " + "\n" + site);

        if (site.equalsIgnoreCase("facebook")) {
            System.out.println("https://www.facebook.com");

        } else if (site.equalsIgnoreCase("google")) {
            System.out.println("https://www.google.com");
        } else {
            System.out.println("Invalid site");
        }
    }

    @Given("I have {string},{string},{string}")
    public void iHave(String arg0, String arg1, String arg2) {
        String[] fruits = {arg0, arg1, arg2};

        System.out.println("Lenth of an array: " + fruits.length);
        System.out.println("Printing array of fruits");
        for (int i = 0; i < fruits.length; i++) {
            System.out.println(i + " :" + fruits[i]);
        }
    }

    @Given("I perform actions with {string}, {string},{string}, {string},{string},{string}")
    public void iPerformActionsWith(String arg0, String arg1, String arg2, String arg3, String arg4, String arg5) {
        String[] groceryList = {arg0, arg1, arg2, arg3, arg4, arg5};
        System.out.println("print GroceryList without index" + Arrays.toString(groceryList));


        System.out.println("print GroceryList with index");
        for (int i = 0; i < groceryList.length; i++) {
            System.out.println((i + 1) + " : " + groceryList[i]);
        }

        System.out.println("print GroceryList with index 0 : " + groceryList[0]);
        System.out.println("print GroceryList with index 2 : " + groceryList[2]);

        //for each loop for element
        for (String element : groceryList) {

            System.out.println(element);
        }

        int[] numArray = {2, 45, 6, 7, 23};
        for (int element : numArray) {

            System.out.println(element);
        }
    }

    @Given("I perform actions with two variables {string} and {string}")
    public void iPerformActionsWithTwoVariablesAnd(String str1, String str2) {
        System.out.println("String1: " + str1 + "\n" + "String2: " + str2);
        System.out.println("Lowercase for String1: " + str1.toLowerCase());
        System.out.println("Uppercase for String2: " + str2.toUpperCase());
        String firstName = "Deepika";
        String lastName = "Mathur";
        String favColor = "yellow";
        System.out.println(firstName + "  " + lastName + " likes " + favColor);
        System.out.println(lastName.length());
    }

    @Given("I run operator with {int} and {int}")
    public void iRunOperatorWithAnd(int num1, int num2) {
        System.out.println(num1);
        System.out.println(num2);
        if (num1 < num2) {
            System.out.println("FirstNumber less than second");
        } else {
            System.out.println("FirstNumber greater than second");
        }
    }
}
