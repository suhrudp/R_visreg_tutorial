# VISUALIZE REGRESSION MODELS USING THE `visreg` PACKAGE

## **LOAD LIBRARIES**

```{r}
library(tidyverse)
library(visreg)
library(mgcv)
library(gtsummary)
library(report)
```

## **ATTACH DATA**

```{r}
df <- carData::Wong
attach(df)
View(df)
?carData::Wong
```

## **DESCRIPTIVE ANALYSIS**

```{r}
tbl_summary(df[c("days", "duration", "sex", "age", "piq", "viq")])
```

## VISUALIZE DATA

```{r}
ggplot(data=df, aes(x=duration, y=piq)) + geom_point()
ggplot(data=df, aes(x=duration, y=viq)) + geom_point()
```

## GENERALIZED ADDITIVE MODELING

```{r}
fit1 <- gam(data=df, piq ~ s(duration))
```

## VISUALIZE THE MODEL

```{r}
visreg(fit1)
```

## ADJUSTED MODEL

```{r}
fit2 <- gam(data=df, piq ~ s(duration) + age + sex)
```

## VISUALIZE THE MODEL

```{r}
visreg(fit2, "duration", by="sex", overlay=T)
visreg(fit2, "duration", type="contrast")
```
