


$a = @(
	@('5','3','.'),
	@('6','.','.'),
	@('.','9','8')
)


function Print-Board {
	0 .. $a.Length | %{ $a[$_] -join '' }
# 	for ($i=0; $i-lt3; $i++ ) {
# 		for ($j=0; $j-lt3; $j++ ) {
# 			
# 		}
# 	}
}

$a

<#
function Try3x3 {
	$target_number
	for ($i=0; $i -lt 3; $i++) {
		for ($j=0; $j -lt 3; $j++) {
			$b[$i,$j]
		}
	}
}
#>
