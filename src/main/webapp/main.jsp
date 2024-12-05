<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<style>
.container {
	display: flex;
	flex-direction: column;
	height: 100vh;
}

.top {
	height: 10%;
}

.main-content {
	display: flex;
	flex-grow: 1;
}

.left-pane {
	width: 20%;
	display: flex;
	flex-direction: column;
}

.bottom-left-frame {
	flex: 1;
	border: none;
}

.right-pane {
	width: 80%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="top">
			<iframe name="top" src="top.jsp"
				style="width: 100%; height: 100%; border: none;"></iframe>
		</div>
		<div class="main-content">
			<div class="left-pane">
				<iframe name="bottom_left_gro" src="bottom_left_gro.jsp"
					class="bottom-left-frame"></iframe>
				<iframe name="bottom_left_clo" src="bottom_left_clo.jsp"
					class="bottom-left-frame"></iframe>
				<iframe name="bottom_left_fru" src="bottom_left_fruits.jsp"
					class="bottom-left-frame"></iframe>
				<iframe name="bottom_left_cos" src="bottom_left_cos.jsp"
					class="bottom-left-frame"></iframe>
				<iframe name="bottom_left_cos" src="bottom_left_veg.jsp"
					class="bottom-left-frame"></iframe>
			</div>
			<div class="right-pane">
				<iframe name="bottom_right" src="bottom_right.jsp"
					style="width: 100%; height: 100%; border: none;"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
