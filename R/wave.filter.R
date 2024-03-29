#' Select a Wavelet Filter
#' 
#' Converts name of wavelet filter to filter coefficients.
#' 
#' Simple \code{switch} statement selects the appropriate filter.
#' 
#' @param name Character string of wavelet filter.
#' @return List containing the following items: \item{L}{Length of the wavelet
#' filter.} \item{hpf}{High-pass filter coefficients.} \item{lpf}{Low-pass
#' filter coefficients.}
#' @author B. Whitcher
#' @seealso \code{\link{wavelet.filter}}, \code{\link{squared.gain}}.
#' @references Daubechies, I. (1992) \emph{Ten Lectures on Wavelets}, CBMS-NSF
#' Regional Conference Series in Applied Mathematics, SIAM: Philadelphia.
#' 
#' Doroslovacki (1998) On the least asymmetric wavelets, \emph{IEEE
#' Transactions for Signal Processing}, \bold{46}, No. 4, 1125-1130.
#' 
#' Morris and Peravali (1999) Minimum-bandwidth discrete-time wavelets,
#' \emph{Signal Processing}, \bold{76}, No. 2, 181-193.
#' 
#' Nielsen, M. (2000) On the Construction and Frequency Localization of
#' Orthogonal Quadrature Filters, \emph{Journal of Approximation Theory},
#' \bold{108}, No. 1, 36-52.
#' @keywords ts
#' @export wave.filter
wave.filter <- function(name)
{
  select.haar <- function() {
    L <- 2
    g <- c(0.7071067811865475, 0.7071067811865475)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.d4 <- function() {
    L <- 4
    g <- c(0.4829629131445341, 0.8365163037378077, 0.2241438680420134, 
	  -0.1294095225512603)
    h <- qmf(g)

    return(list(length = L, hpf = h, lpf = g))
  }
  select.mb4 <- function() {
    L <- 4
    g <- c(4.801755e-01, 8.372545e-01, 2.269312e-01, -1.301477e-01)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.bs3.1 <- function() {
    L <- 4
    g <- c(0.1767767, 0.5303301, 0.5303301, 0.1767767)
    h <- qmf(g)
    gd <- c(0.3535534, 1.06066, -1.06066, -0.3535534)
    hd <- qmf(g)
    return(list(length = L, hpf = h, lpf = g, dhpf = hd, dlpf = gd))
  }
  select.w4 <- function() {
    L <- 4
    g <- c(-1, 3, 3, -1) / 8
    h <- c(-1, 3, -3, 1) / 8
    return(list(length = L, hpf = h, lpf = g))
  }
  select.fk4 <- function() {
    L <- 4
    g <- c(.6539275555697651, .7532724928394872, .5317922877905981e-1,
          -.4616571481521770e-1)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.d6 <- function() {
    L <- 6
    g <- c(0.3326705529500827, 0.8068915093110928, 0.4598775021184915,
          -0.1350110200102546, -0.0854412738820267, 0.0352262918857096)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.fk6 <- function() {
    L <- 6
    g <- c(.4279150324223103, .8129196431369074, .3563695110701871,
          -.1464386812725773, -.7717775740697006e-1, .4062581442323794e-1)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.d8 <- function() {
    L <- 8
    g <- c(0.2303778133074431, 0.7148465705484058, 0.6308807679358788,
          -0.0279837694166834, -0.1870348117179132, 0.0308413818353661,
          0.0328830116666778, -0.0105974017850021)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.fk8 <- function() {
    L <- 8
    g <- c(.3492381118637999, .7826836203840648, .4752651350794712,
          -.9968332845057319e-1, -.1599780974340301, .4310666810651625e-1,
          .4258163167758178e-1, -.1900017885373592e-1)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.la8 <- function() {
    L <- 8
    g <- c(-0.07576571478935668, -0.02963552764596039, 0.49761866763256290, 
	  0.80373875180538600, 0.29785779560560505, -0.09921954357695636, 
	  -0.01260396726226383, 0.03222310060407815)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.mb8 <- function() {
    L <- 8
    g <- rev(c(-1.673619e-01, 1.847751e-02, 5.725771e-01, 7.351331e-01,
	   2.947855e-01, -1.108673e-01, 7.106015e-03, 6.436345e-02))
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.bl14 <- function() {
    L <- 14
    g <- c( 0.0120154192834842, 0.0172133762994439, -0.0649080035533744,
	  -0.0641312898189170, 0.3602184608985549, 0.7819215932965554,
	   0.4836109156937821, -0.0568044768822707, -0.1010109208664125,
	   0.0447423494687405, 0.0204642075778225, -0.0181266051311065,
	  -0.0032832978473081, 0.0022918339541009)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.fk14 <- function() {
    L <- 14
    g <- c(.2603717692913964, .6868914772395985, .6115546539595115,
          .5142165414211914e-1, -.2456139281621916, -.4857533908585527e-1,
          .1242825609215128, .2222673962246313e-1, -.6399737303914167e-1,
          -.5074372549972850e-2, .2977971159037902e-1, -.3297479152708717e-2,
          -.9270613374448239e-2, .3514100970435962e-2)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.d16 <- function() {
    L <- 16
    g <- c(0.0544158422431049, 0.3128715909143031, 0.6756307362972904,
	  0.5853546836541907, -0.0158291052563816, -0.2840155429615702,
	  0.0004724845739124, 0.1287474266204837, -0.0173693010018083,
	 -0.0440882539307952, 0.0139810279173995, 0.0087460940474061,
	 -0.0048703529934518, -0.0003917403733770, 0.0006754494064506,
	 -0.0001174767841248)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.la16 <- function() {
    L <- 16
    g <- c(-0.0033824159513594, -0.0005421323316355, 0.0316950878103452, 
	   0.0076074873252848, -0.1432942383510542, -0.0612733590679088, 
	   0.4813596512592012, 0.7771857516997478, 0.3644418948359564, 
	  -0.0519458381078751, -0.0272190299168137, 0.0491371796734768, 
	   0.0038087520140601, -0.0149522583367926, -0.0003029205145516, 
	   0.0018899503329007)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.mb16 <- function() {
    L <- 16
    g <- rev(c(-1.302770e-02, 2.173677e-02, 1.136116e-01, -5.776570e-02, 
	  -2.278359e-01, 1.188725e-01, 6.349228e-01, 6.701646e-01, 
	   2.345342e-01, -5.656657e-02, -1.987986e-02, 5.474628e-02, 
	  -2.483876e-02, -4.984698e-02, 9.620427e-03, 5.765899e-03))
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.la20 <- function() {
    L <- 20
    g <- c(0.0007701598091030, 0.0000956326707837, -0.0086412992759401,
	 -0.0014653825833465, 0.0459272392237649, 0.0116098939129724,
	 -0.1594942788575307, -0.0708805358108615, 0.4716906668426588,
	  0.7695100370143388, 0.3838267612253823, -0.0355367403054689,
	 -0.0319900568281631, 0.0499949720791560, 0.0057649120455518,
	 -0.0203549398039460, -0.0008043589345370, 0.0045931735836703,
	  0.0000570360843390, -0.0004593294205481)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.bl20 <- function() {
    L <- 20
    g <- c(0.0008625782242896, 0.0007154205305517, -0.0070567640909701,
	  0.0005956827305406, 0.0496861265075979, 0.0262403647054251,
	 -0.1215521061578162, -0.0150192395413644, 0.5137098728334054,
	  0.7669548365010849, 0.3402160135110789, -0.0878787107378667,
	 -0.0670899071680668, 0.0338423550064691, -0.0008687519578684,
	 -0.0230054612862905, -0.0011404297773324, 0.0050716491945793,
	  0.0003401492622332, -0.0004101159165852)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.fk22 <- function() {
    L <- 22
    g <- c(.1938961077599566, .5894521909294277, .6700849629420265,
          .2156298491347700, -.2280288557715772, -.1644657152688429,
          .1115491437220700, .1101552649340661, -.6608451679377920e-1,
          -.7184168192312605e-1, .4354236762555708e-1, .4477521218440976e-1,
          -.2974288074927414e-1, -.2597087308902119e-1, .2028448606667798e-1,
          .1296424941108978e-1, -.1288599056244363e-1, -.4838432636440189e-2,
          .7173803165271690e-2, .3612855622194901e-3, -.2676991638581043e-2,
          .8805773686384639e-3)
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }
  select.mb24 <- function() {
    L <- 24
    g <- rev(c(-2.132706e-05, 4.745736e-04, 7.456041e-04, -4.879053e-03,
	  -1.482995e-03, 4.199576e-02, -2.658282e-03, -6.559513e-03,
	   1.019512e-01, 1.689456e-01, 1.243531e-01, 1.949147e-01,
	   4.581101e-01, 6.176385e-01, 2.556731e-01, -3.091111e-01,
	  -3.622424e-01, -4.575448e-03, 1.479342e-01, 1.027154e-02,
	  -1.644859e-02, -2.062335e-03, 1.193006e-03, 5.361301e-05))
    h <- qmf(g)
    return(list(length = L, hpf = h, lpf = g))
  }

  switch(name,
    "haar" = select.haar(),
    "d4" = select.d4(),
    "mb4" = select.mb4(),
    "w4" = select.w4(),
    "bs3.1" = select.bs3.1(),
    "fk4" = select.fk4(),
    "d6" = select.d6(),
    "fk6" = select.fk6(),
    "d8" = select.d8(),
    "fk8" = select.fk8(),
    "la8" = select.la8(),
    "mb8" = select.mb8(),
    "bl14" = select.bl14(),
    "fk14" = select.fk14(),
    "d16" = select.d16(),
    "la16" = select.la16(),
    "mb16" = select.mb16(),
    "la20" = select.la20(),
    "bl20" = select.bl20(),
    "fk22" = select.fk22(),
    "mb24" = select.mb24(),
    stop("Invalid selection for wave.filter"))
}



#' Quadrature Mirror Filter
#' 
#' Computes the quadrature mirror filter from a given filter.
#' 
#' None.
#' 
#' @param g Filter coefficients.
#' @param low2high Logical, default is \code{TRUE} which means a low-pass
#' filter is input and a high-pass filter is output.  Setting \code{low2high=F}
#' performs the inverse.
#' @return Quadrature mirror filter.
#' @author B. Whitcher
#' @seealso \code{\link{wave.filter}}.
#' @references Any basic signal processing text.
#' @keywords ts
#' @examples
#' 
#' ## Haar wavelet filter
#' g <- wave.filter("haar")$lpf
#' qmf(g)
#' 
#' @export qmf
qmf <- function(g, low2high = TRUE) {
  L <- length(g)
  if(low2high)
    h <- (-1)^(0:(L - 1)) * rev(g)
  else
    h <- (-1)^(1:L) * rev(g)
  return(h)
}
