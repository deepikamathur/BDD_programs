package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class JavaWebDriverStepdefs {
    @Given("I go to {string} page and print details test")
    public void iGoToPageAndPrintDetailsTest(String page) {
        if (page.equals("google")) {
            getDriver().get("http://www.google.com/");
        } else if (page.equals("Get a Quote")) {
            getDriver().get("http://skryabin.com/webdriver/html/quote.html");
        } else {
            System.out.println("Unknown page " + getDriver().getCurrentUrl());
        }
        System.out.println(getDriver().getTitle());
        System.out.println();
        System.out.println(getDriver().getCurrentUrl());
    }


    @And("I go back and forward, then refresh the page")
    public void iGoBackAndForwardThenRefreshThePage() {
        getDriver().navigate().to("http://skryabin.com/webdriver/html/quote.html");
        getDriver().navigate().back();
        getDriver().navigate().forward();
        getDriver().navigate().refresh();
    }

    @Given("I open url {string} then {string} then {string}")
    public void iOpenUrlThenThen(String page1, String page2, String page3) {
        String[] urlArray = {page1, page2, page3};
        for (int i = 0; i < urlArray.length; i++) {
            System.out.println(urlArray[i]);
        }
    }


    @Given("I open url {string} page")
    public void iOpenUrlPage(String arg0) {
        getDriver().get("https://skryabin.com/webdriver/html/quote.html");
    }


    @When("I fill out first name {string} and last name {string}")
    public void iFillOutFirstNameAndLastName(String fn, String ln) throws InterruptedException {
        getDriver().findElement(By.xpath("//input[@id='name']")).click();
        getDriver().findElement(By.xpath("//input[@id='firstName']")).sendKeys(fn);
        getDriver().findElement(By.xpath("//input[@id='lastName']")).sendKeys(ln);
        getDriver().findElement(By.xpath("//span[contains(text(),'Save')]")).click();

    }


    @And("I fill out required fields")
    public void iFillOutRequiredFields() {
        WebElement element = getDriver().findElement(By.xpath("//input[@name='username']"));
        element.isDisplayed();
        element.sendKeys("DeepikaMathur");
        WebElement element1 = getDriver().findElement(By.xpath("//input[@name='email']"));
        element1.isDisplayed();
        element1.sendKeys("deepikamathur204@gmail.com");
        WebElement element2 = getDriver().findElement(By.id("password"));
        element2.sendKeys("12345");
        WebElement element3 = getDriver().findElement(By.id("confirmPassword"));
        element3.sendKeys("12345");
        getDriver().findElement(By.xpath("//input[@name='agreedToPrivacyPolicy']")).click();
        getDriver().findElement(By.id("formSubmit")).click();
    }


    @Then("I assert required fields")
    public void iAssertRequiredFields() {
        WebElement resultPage = getDriver().findElement(By.id("quotePageResult"));
        assertThat(resultPage.isDisplayed()).isTrue();
        String actualPrivacyPolicy = getDriver().findElement(By.xpath("//b[@name='agreedToPrivacyPolicy']")).getText();
        assertThat(actualPrivacyPolicy).isEqualToIgnoringCase("true");
        String resultText = getDriver().findElement(By.xpath("//div[@id='quotePageResult']//section")).getText();
        System.out.println(resultText);
        assertThat(resultText).containsIgnoringCase("Deepika Mathur");
        assertThat(resultText).containsIgnoringCase("deepikamathur204@gmail.com");
        assertThat(resultText).containsIgnoringCase("[entered]");
        assertThat(resultText).doesNotContain("12345");
        String actualDate = getDriver().findElement(By.xpath("//b[@name='currentDate']")).getText();
        assertThat(actualDate).isEqualTo("04/14/2020");
        String username = getDriver().findElement(By.xpath("//b[@name='username']")).getText();
        assertThat(username).isEqualToIgnoringCase("DeepikaMathur");
    }

    @Given("I open url {string} page one")
    public void iOpenUrlPageone(String arg0) {
        getDriver().get("https://skryabin.com/webdriver/html/quote.html");
    }


    @When("I change resolution to {string}")
    public void iChangeResolutionTo(String layout) {
        Dimension size;
        switch (layout) {
            case ("phone"):
                size = new Dimension(650, 1066);
                getDriver().manage().window().setSize(size);
                System.out.println(size);
                break;
            case ("ipad"):
                size = new Dimension(800, 1066);
                getDriver().manage().window().setSize(size);
                System.out.println(size);
                break;
            case ("destop"):
                size = new Dimension(930, 1066);
                getDriver().manage().window().setSize(size);
                System.out.println(size);
                break;

            default:
                throw new RuntimeException("not supported layout");
        }

    }
}

