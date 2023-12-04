
It is given that for the gaussian two point quadrature rule we have:

$$\int_{-1}^1 f(x)dx \approx f\left(-\frac{\sqrt{3}}{3}\right) +f\left(\frac{\sqrt{3}}{3}\right)$$
To compute $\int_a^b f(x)dx$ , over the n sub instervals $[x_i,x_{i+1}]$
i = 0, ... , n-1, we want to use the gaussian quadtrature rule over the sub intervals.

The quadrature rule however is over the standard interval , and not the sub intervals. We will have to shift the rule to be over the the sub intervals we want.

Note that in class we saw a way to do this

We can set 

$$x = \alpha + \beta \cdot t$$

where 
$$\alpha = \frac{1}{2}(a+b) , \beta = \frac{1}{2}(b-a)$$

Note that the length of our subintervals, h , is given by

$$h = \frac{b-a}{n}$$

This means that we have

$$\int_a^b f(x)dx = \beta \int^1_{-1} f(\alpha + \beta \cdot t)$$

This is over the standard interval, so we can use our simpsons rule and get


$$\beta \int^1_{-1} f(\alpha + \beta \cdot t) \approx \beta \cdot ( f\left(\alpha + \beta \cdot -\frac{\sqrt{3}}{3}\right) +f\left(\alpha + \beta\frac{\sqrt{3}}{3}\right) )$$

We can then plug in alpha and beta to get

$$=f\left(\frac{1}{2}(a+b) + \frac{1}{2}(b-a) \cdot -\frac{\sqrt{3}}{3}\right) +f\left(\frac{1}{2}(a+b) + \frac{1}{2}(b-a) \cdot \frac{\sqrt{3}}{3}\right)$$
$$=f\left(\frac{1}{2}(a+b) + (b-a) \cdot -\frac{\sqrt{3}}{6}\right) +f\left(\frac{1}{2}(a+b) + (b-a) \cdot \frac{\sqrt{3}}{6}\right)$$

Now we can shift our quadrature rule to any interval

We will use this, to shift it to each of our sub intervals, and then sum over our sub interval

note that the formula for $x_i$ is given by

$x_i = a + h * i$

So our sum is

$\frac{h}{2} \sum^{n-1}_{i=0} f\left(\frac{x_i+x_{i+1}}{2} + (x_{i+1}-x_i) \cdot -\frac{\sqrt{3}}{6}\right) +f\left(\frac{x_i+x_{i+1}}{2} + (x_{i+1}-x_i) \cdot \frac{\sqrt{3}}{6}\right)$ 

Note that, $x_{i+1}-x_i$ is just the length of the interval we are integratine over for each sub interval

However, we know that for all sub intervals, their lengtth is the same and is equal to
$h = \frac{b-a}{n}$
So we have

$\frac{h}{2} \sum^{n-1}_{i=0} f\left(\frac{x_i+x_{i+1}}{2} +  \frac{h \cdot\sqrt{3}}{6}\right) +f\left(\frac{x_i+x_{i+1}}{2} +  \frac{h \cdot\sqrt{3}}{6}\right)$ 

Note the we could also express in terms of h

$$x_i + x_{i+1} = (a + h * i) + (a + h * (i +1))$$
$$x_i + x_{i+1} = 2a + (2i+1)*h$$
$$(x_i + x_{i+1}) / 2 = a + i*h +h/2$$



