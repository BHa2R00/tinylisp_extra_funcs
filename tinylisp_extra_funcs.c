
//basic math
L f_abs(L t,L e) { return fabs(car(evlis(t,e))); }
L f_expt(L t,L e) { return t = evlis(t,e),pow(car(t),car(cdr(t))); }

//float point
L f_fp_frac(L t,L e) { L x = car(evlis(t,e)); int n; L m = frexp(x,&n); return m; }
L f_fp_expt(L t,L e) { L x = car(evlis(t,e)); int n; L m = frexp(x,&n); return (L)n; }
L f_fp_sign(L t,L e) { L x = car(evlis(t,e)); return (x < 0) ? (L)1 : (L)0; }


//string
L catstr2(const char* s1,const char* s2){
	char* r = (char*)malloc(sizeof(char)*(strlen(s1)+strlen(s2)));
	strcpy(r,s1);strcat(r,s2);
	return atom(r);
}
L f_catstr(L t,L e) { L n = car(t = evlis(t,e)); while (!not(t = cdr(t))) n = catstr2(A+ord(n),A+ord(car(t))); return n; }

//binary
L f_ash(L t,L e) {
	L x = car(evlis(t,e));
	L k = car(cdr(evlis(t,e)));
	return (k<0) ? (L)((I)x >> (I)fabs(k)) : (L)((I)x << (I)fabs(k));
}
L f_lognot(L t,L e) { return t = evlis(t,e),-(car(t)+1); }
L f_logand(L t,L e) { return t = evlis(t,e),(I)car(t)&(I)car(cdr(t)); }
L f_logor(L t,L e) { return t = evlis(t,e),(I)car(t)|(I)car(cdr(t)); }
L f_logxor(L t,L e) { return t = evlis(t,e),(I)car(t)^(I)car(cdr(t)); }
