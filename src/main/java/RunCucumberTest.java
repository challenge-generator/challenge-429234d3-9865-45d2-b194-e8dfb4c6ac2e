package com.fintech.performance;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
    features = "src/test/resources/features",
    glue = {"com.fintech.performance.steps"},
    plugin = {"pretty", "html:target/cucumber-reports/cucumber.html",
              "json:target/cucumber-reports/cucumber.json"},
    monochrome = true,
    tags = "@performance"
)
public class RunCucumberTest {
}