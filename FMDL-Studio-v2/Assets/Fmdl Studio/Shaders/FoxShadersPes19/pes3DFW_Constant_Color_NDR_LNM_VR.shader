Shader "FoxShaders/pes3DFW_Constant_Color_NDR_LNM_VR" {
Properties {
	_SelfColor("SelfColor", Vector) = (0.0, 0.0, 0.0, 0.0)
	_Base_Tex_LIN("Base_Tex_LIN", 2D) = "white" {}
	_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
}

SubShader {
	Tags {"Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}
	LOD 400

CGPROGRAM
#pragma surface surf BlinnPhong alphatest:_Cutoff
#pragma target 3.0


struct Input {
	float2 uv_Base_Tex_SRGB;
};

void surf (Input IN, inout SurfaceOutput o) {
}
ENDCG
}

FallBack "Standard"
}