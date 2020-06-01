<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
</head>
<body>
	<p id="result"></p>
	<div id="map" style="width: 800px; height: 700px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=291ae91548b72e5c96e2ad42f5772f46"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.3004755, 127.034374),
			level : 5
		};

		var map = new kakao.maps.Map(container, options);

		// ��Ʈ�� �ٸ� ���� ���� ǥ���մϴ�.
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		// ���� �Ĺ� ��Ŀ ǥ��
		var positions = [
			{
				title: '����',
				latlng: new kakao.maps.LatLng(37.3016229, 127.0337445)
			},
			{
				title: '���� ���',
				latlng: new kakao.maps.LatLng(37.2973027, 127.0328685)
			},
			{
				title: '�Ĺ�',
				latlng: new kakao.maps.LatLng(37.2975997, 127.0412514)
			},
			{
				title: '�Ĺ� ����',
				latlng: new kakao.maps.LatLng(37.3005728,  127.0420200)
			}
		]
 		for (position of positions) {
			console.log(position)
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng,
				title: position.title
			});
		} 


	</script>

	<script>
		var registerMarker = new kakao.maps.Marker();
		var myInfoWindow = new kakao.maps.InfoWindow({});

		// Ŭ���� ���� ��Ŀ ǥ�� ���� �浵 ǥ��
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
			registerMarker.setMap(null);
			myInfoWindow.close();
			
			// ��Ŀ ����
			registerMarker = new kakao.maps.Marker({
				position: latlng,
			});
			registerMarker.setMap(map);
			
			// ���������츦 �����մϴ�
			var iwContent = '<div style="padding:5px;">My Home!!</div>', 
		    iwPosition = new kakao.maps.LatLng(latlng); 
			myInfoWindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
				removable: true
			});
			myInfoWindow.open(map, registerMarker); 
				    
			
			////
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
		
		// ��ǥ Ŭ�� �� ��ǥ�� ǥ�� �̺�Ʈ
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng;
		    
		    var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
		    message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		});
	</script>
</body>
</html>