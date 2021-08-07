// https://www.hiveworkshop.com/threads/unit-name-from-integer-unitid.52007/

library idutils
	constant function StringNum takes nothing returns string
		return "0123456789"
	endfunction
	constant function StringABC takes nothing returns string
		return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	endfunction
	constant function Stringabc takes nothing returns string
		return "_`abcdefghijklmnopqrstuvwxyz"
	endfunction
	function S2ID takes string source returns integer
		local integer Id = 0
		local integer n1 = 1
		local integer n2 = 1
		loop
			exitwhen(n1>StringLength(source))
			loop
				exitwhen(n2>10)
				if(SubString(source,n1-1,n1)==SubString(StringNum(),n2-1,n2))then
					set Id=Id+R2I(('0'+n2-1)*Pow(256.00,I2R(StringLength(source)-n1)))
				endif
				n2++
			endloop
			set n2=1
			loop
				exitwhen(n2>26)
				if(SubString(source,n1-1,n1)==SubString(StringABC(),n2-1,n2))then
					set Id=Id+R2I(I2R('A'+n2-1)*Pow(256.00,I2R(StringLength(source)-n1)))
				endif
				n2++
			endloop
			set n2=1
			loop
				exitwhen(n2>28)
				if(SubString(source,n1-1,n1) == SubString(Stringabc(),n2-1,n2))then
					set Id=Id+R2I(('_'+n2-1)*Pow(256.00,I2R(StringLength(source)-n1)))
				endif
				n2++
			endloop
			set n2=1
			set n1=n1+1
		endloop
		return Id
	endfunction
	function ID2S takes integer num returns string
		local string target=""
		local integer n=0
		local integer dis=0
		loop
			exitwhen(num==0)
			set n=ModuloInteger(num,256)
			if(n>='0' and n<='9')then
				set dis=n-'0'
				set target=SubString(StringNum(),dis,dis+1)+target
			endif
			if(n>='A' and n<='Z')then
				set dis=n-'A'
				set target=SubString(StringABC(),dis,dis+1)+target
			endif
			if(n>='_' and n<='z')then
				set dis=n-'_'
				set target=SubString(Stringabc(),dis,dis+1)+target
			endif
			set num=num/256
		endloop
		return target
	endfunction
endlibrary
