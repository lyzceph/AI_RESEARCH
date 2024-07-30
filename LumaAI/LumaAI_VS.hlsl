
#line 1027 "/Engine/Public/Platform.ush"
float CondMask(bool Cond, float Src0, float Src1) {
  return Cond ? Src0 : Src1;
}


#line 38 "/Engine/Private/Common.ush"
struct FloatDeriv {
  float Value;
  float Ddx;
  float Ddy;
};
#line 45 "/Engine/Private/Common.ush"
struct FloatDeriv2 {
  float2 Value;
  float2 Ddx;
  float2 Ddy;
};
#line 52 "/Engine/Private/Common.ush"
struct FloatDeriv3 {
  float3 Value;
  float3 Ddx;
  float3 Ddy;
};
#line 59 "/Engine/Private/Common.ush"
struct FloatDeriv4 {
  float4 Value;
  float4 Ddx;
  float4 Ddy;
};
#line 116 "/Engine/Private/Common.ush"
static const float PI = 3.14159274F;
#line 117 "/Engine/Private/Common.ush"
static const float MaxHalfFloat = 65504.F;
#line 118 "/Engine/Private/Common.ush"
static const float Max11BitsFloat = 65024.F;
#line 119 "/Engine/Private/Common.ush"
static const float Max10BitsFloat = 64512.F;
#line 120 "/Engine/Private/Common.ush"
static const float3 Max111110BitsFloat3 = float3(Max11BitsFloat, Max11BitsFloat, Max10BitsFloat);
#line 5 "/Engine/Private/Nanite/NanitePackedNaniteView.ush"
struct FPackedNaniteView {
  float4x4 SVPositionToTranslatedWorld;
  float4x4 ViewToTranslatedWorld;
  float4x4 TranslatedWorldToView;
  float4x4 TranslatedWorldToClip;
  float4x4 ViewToClip;
  float4x4 ClipToRelativeWorld;
  float4x4 PrevTranslatedWorldToView;
  float4x4 PrevTranslatedWorldToClip;
  float4x4 PrevViewToClip;
  float4x4 PrevClipToRelativeWorld;
  int4 ViewRect;
  float4 ViewSizeAndInvSize;
  float4 ClipSpaceScaleOffset;
  float3 RelativePreViewTranslation;
  float ViewTilePositionX;
  float3 RelativePrevPreViewTranslation;
  float ViewTilePositionY;
  float3 RelativeWorldCameraOrigin;
  float ViewTilePositionZ;
  float3 DrawDistanceOriginTranslatedWorld;
  float RangeBasedCullingDistance;
  float3 ViewForward;
  float NearPlane;
  float4 TranslatedGlobalClipPlane;
  float3 MatrixTilePosition;
  float Padding1;
  float2 LODScales;
  float MinBoundsRadiusSq;
  uint StreamingPriorityCategory_AndFlags;
  int4 TargetLayerIdX_AndMipLevelY_AndNumMipLevelsZ;
  int4 HZBTestViewRect;
};
#line 5 "/Engine/Private/HairStrands/HairStrandsVisibilityCommonStruct.ush"
struct FPackedHairSample {
  float Depth;
  uint ControlPointID_MacroGroupID;
  uint Tangent_Coverage8bit;
  uint BaseColor_Roughness;
  uint Specular_LightChannels_Backlit;
};
#line 14 "/Engine/Private/HairStrands/HairStrandsVisibilityCommonStruct.ush"
struct FPackedHairVis {
  uint Depth_Coverage8bit;
  uint ControlPointID_MaterialID;
};
#line 20 "/Engine/Private/HairStrands/HairStrandsVisibilityCommonStruct.ush"
struct FPackedHairVisPPLL {
  uint Depth_Coverage8bit;
  uint ControlPointID_MaterialID;
  uint NextNodeIndex;
};
#line 5 "/Engine/Private/HairStrands/HairStrandsVoxelPageCommonStruct.ush"
struct FPackedVirtualVoxelNodeDesc {
  float3 TranslatedWorldMinAABB;
  uint PackedPageIndexResolution;
  float3 TranslatedWorldMaxAABB;
  uint PageIndexOffset_VoxelWorldSize;
};
#line 5 "/Engine/Private/HairStrands/HairStrandsDeepShadowCommonStruct.ush"
struct FDeepShadowViewInfo {
  float4x4 TranslatedWorldToClipScaledBiased;
  float4x4 TranslatedWorldToClip;
  float4 AtlasScaleBias;
  float3 ViewForward;
  float MinRadiusAtDepth1;
};
#line 5 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCScalar {
  float Tile;
  float Offset;
};
#line 11 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector2 {
  float2 Tile;
  float2 Offset;
};
#line 17 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector3 {
  float3 Tile;
  float3 Offset;
};
#line 23 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector4 {
  float4 Tile;
  float4 Offset;
};
#line 29 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCScalarDeriv {
  FLWCScalar Value;
  float Ddx;
  float Ddy;
};
#line 36 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector2Deriv {
  FLWCVector2 Value;
  float2 Ddx;
  float2 Ddy;
};
#line 43 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector3Deriv {
  FLWCVector3 Value;
  float3 Ddx;
  float3 Ddy;
};
#line 50 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCVector4Deriv {
  FLWCVector4 Value;
  float4 Ddx;
  float4 Ddy;
};
#line 58 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCMatrix {
  float4x4 M;
  float3 Tile;
};
#line 65 "/Engine/Private/LargeWorldCoordinates.ush"
struct FLWCInverseMatrix {
  float4x4 M;
  float3 Tile;
  int Dummy;
};
#line 77 "/Engine/Private/LargeWorldCoordinates.ush"
float3 LWCGetTileOffset(FLWCVector3 V) {
  return ((V).Tile) * 2097152.F;
}


#line 82 "/Engine/Private/LargeWorldCoordinates.ush"
float4x4 Make4x3Matrix(float4x4 M) {
  float4x4 Result;
  Result[0] = float4(M[0].xyz, 0.F);
  Result[1] = float4(M[1].xyz, 0.F);
  Result[2] = float4(M[2].xyz, 0.F);
  Result[3] = float4(M[3].xyz, 1.F);
  return Result;
}


#line 119 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCVector3 MakeLWCVector3(float3 Tile, float3 Offset) {
  FLWCVector3 Result;
  (Result).Tile = (Tile);
  Result.Offset = Offset;
  return Result;
}


#line 161 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCMatrix MakeLWCMatrix(float3 Tile, float4x4 InMatrix) {
  FLWCMatrix Result;
  (Result).Tile = (Tile);
  Result.M = InMatrix;
  return Result;
}


#line 169 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCMatrix MakeLWCMatrix4x3(float3 Tile, float4x4 InMatrix) {
  FLWCMatrix Result;
  (Result).Tile = (Tile);
  Result.M = Make4x3Matrix(InMatrix);
  return Result;
}


#line 177 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCInverseMatrix MakeLWCInverseMatrix(float3 Tile, float4x4 InMatrix) {
  FLWCInverseMatrix Result;
  (Result).Tile = (-Tile);
  Result.M = InMatrix;
  Result.Dummy = 0;
  return Result;
}


#line 186 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCInverseMatrix MakeLWCInverseMatrix4x3(float3 Tile, float4x4 InMatrix) {
  FLWCInverseMatrix Result;
  (Result).Tile = (-Tile);
  Result.M = Make4x3Matrix(InMatrix);
  Result.Dummy = 0;
  return Result;
}


#line 229 "/Engine/Private/LargeWorldCoordinates.ush"
float3 LWCToFloat(FLWCVector3 Value) {
  return LWCGetTileOffset(Value) + Value.Offset;
}


#line 245 "/Engine/Private/LargeWorldCoordinates.ush"
float3x3 LWCToFloat3x3(FLWCMatrix Value) {
  return (float3x3)Value.M;
}


#line 272 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCVector3 LWCPromote(float3 Value) {
  return MakeLWCVector3((float3)0, Value);
}


#line 274 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCMatrix LWCPromote(float4x4 Value) {
  return MakeLWCMatrix((float3)0, Value);
}


#line 277 "/Engine/Private/LargeWorldCoordinates.ush"
FLWCVector3 LWCMultiply(float3 Position, FLWCMatrix InMatrix) {
  float3 Offset = (Position.xxx * InMatrix.M[0].xyz + Position.yyy * InMatrix.M[1].xyz + Position.zzz * InMatrix.M[2].xyz) + InMatrix.M[3].xyz;
  return MakeLWCVector3(((InMatrix).Tile), Offset);
}


#line 52 "/Engine/Private/LWCOperations.ush"
FLWCVector3 LWCAdd(FLWCVector3 Lhs, FLWCVector3 Rhs) {
  return MakeLWCVector3(((Lhs).Tile) + ((Rhs).Tile), Lhs.Offset + Rhs.Offset);
}


#line 54 "/Engine/Private/LWCOperations.ush"
FLWCVector3 LWCAdd(FLWCVector3 Lhs, float3 Rhs) {
  return MakeLWCVector3(((Lhs).Tile), Lhs.Offset + Rhs);
}


#line 56 "/Engine/Private/LWCOperations.ush"
FLWCVector3 LWCSubtract(FLWCVector3 Lhs, FLWCVector3 Rhs) {
  return MakeLWCVector3(((Lhs).Tile) - ((Rhs).Tile), Lhs.Offset - Rhs.Offset);
}


#line 58 "/Engine/Private/LWCOperations.ush"
FLWCVector3 LWCSubtract(FLWCVector3 Lhs, float3 Rhs) {
  return MakeLWCVector3(((Lhs).Tile), Lhs.Offset - Rhs);
}


#line 19 "/Engine/Shared/LightSceneData.h"
struct FLightSceneData {
  FLWCVector3 WorldPosition;
  float InvRadius;
  float4 Color;
  float FalloffExponent;
  float3 Direction;
  float SpecularScale;
  float3 Tangent;
  float SourceRadius;
  float2 SpotAngles;
  float SoftSourceRadius;
  float SourceLength;
  float RectLightBarnCosAngle;
  float RectLightBarnLength;
  float2 RectLightAtlasUVOffset;
  float2 RectLightAtlasUVScale;
  float RectLightAtlasMaxLevel;
  float InverseExposureBlend;
  uint LightTypeAndShadowMapChannelMaskPacked;
};
#line 3 "/Engine/Generated/UniformBuffers/TranslucentBasePass.ush"
cbuffer TranslucentBasePass {
  const uint TranslucentBasePass_Shared_Forward_NumLocalLights;
  const uint TranslucentBasePass_Shared_Forward_NumReflectionCaptures;
  const uint TranslucentBasePass_Shared_Forward_HasDirectionalLight;
  const uint TranslucentBasePass_Shared_Forward_NumGridCells;
  const int3 TranslucentBasePass_Shared_Forward_CulledGridSize;
  const uint TranslucentBasePass_Shared_Forward_MaxCulledLightsPerCell;
  const uint TranslucentBasePass_Shared_Forward_LightGridPixelSizeShift;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_36;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_40;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_44;
  const float3 TranslucentBasePass_Shared_Forward_LightGridZParams;
  const float PrePadding_TranslucentBasePass_Shared_Forward_60;
  const float3 TranslucentBasePass_Shared_Forward_DirectionalLightDirection;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSourceRadius;
  const float3 TranslucentBasePass_Shared_Forward_DirectionalLightColor;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightVolumetricScatteringIntensity;
  const uint TranslucentBasePass_Shared_Forward_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_100;
  const float2 TranslucentBasePass_Shared_Forward_DirectionalLightDistanceFadeMAD;
  const uint TranslucentBasePass_Shared_Forward_NumDirectionalLightCascades;
  const int TranslucentBasePass_Shared_Forward_DirectionalLightVSM;
  const int PrePadding_TranslucentBasePass_Shared_Forward_120;
  const int PrePadding_TranslucentBasePass_Shared_Forward_124;
  const float4 TranslucentBasePass_Shared_Forward_CascadeEndDepths;
  const float4x4 TranslucentBasePass_Shared_Forward_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 TranslucentBasePass_Shared_Forward_DirectionalLightShadowmapMinMax[4];
  const float4 TranslucentBasePass_Shared_Forward_DirectionalLightShadowmapAtlasBufferSize;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightDepthBias;
  const uint TranslucentBasePass_Shared_Forward_DirectionalLightUseStaticShadowing;
  const uint TranslucentBasePass_Shared_Forward_SimpleLightsEndIndex;
  const uint TranslucentBasePass_Shared_Forward_ClusteredDeferredSupportedEndIndex;
  const uint TranslucentBasePass_Shared_Forward_LumenSupportedStartIndex;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_500;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_504;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_508;
  const float4 TranslucentBasePass_Shared_Forward_DirectionalLightStaticShadowBufferSize;
  const float4x4 TranslucentBasePass_Shared_Forward_DirectionalLightTranslatedWorldToStaticShadow;
  const uint TranslucentBasePass_Shared_Forward_DirectLightingShowFlag;
  const float PrePadding_TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_596;
  const float PrePadding_TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_600;
  const float PrePadding_TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_604;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_ScreenRayLength;
  const int TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTRayCount;
  const int TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint TranslucentBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_644;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_648;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_652;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_DirectionalLightShadowmapAtlas;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_660;
  const uint BindlessSampler_TranslucentBasePass_Shared_Forward_ShadowmapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_668;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_DirectionalLightStaticShadowmap;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_676;
  const uint BindlessSampler_TranslucentBasePass_Shared_Forward_StaticShadowmapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_684;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_ForwardLocalLightBuffer;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_692;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_NumCulledLightsGrid;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_700;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_CulledLightDataGrid32Bit;
  const uint PrePadding_TranslucentBasePass_Shared_Forward_708;
  const uint BindlessResource_TranslucentBasePass_Shared_Forward_CulledLightDataGrid16Bit;
  const float PrePadding_TranslucentBasePass_Shared_ForwardISR_716;
  const uint TranslucentBasePass_Shared_ForwardISR_NumLocalLights;
  const uint TranslucentBasePass_Shared_ForwardISR_NumReflectionCaptures;
  const uint TranslucentBasePass_Shared_ForwardISR_HasDirectionalLight;
  const uint TranslucentBasePass_Shared_ForwardISR_NumGridCells;
  const int3 TranslucentBasePass_Shared_ForwardISR_CulledGridSize;
  const uint TranslucentBasePass_Shared_ForwardISR_MaxCulledLightsPerCell;
  const uint TranslucentBasePass_Shared_ForwardISR_LightGridPixelSizeShift;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_756;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_760;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_764;
  const float3 TranslucentBasePass_Shared_ForwardISR_LightGridZParams;
  const float PrePadding_TranslucentBasePass_Shared_ForwardISR_780;
  const float3 TranslucentBasePass_Shared_ForwardISR_DirectionalLightDirection;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSourceRadius;
  const float3 TranslucentBasePass_Shared_ForwardISR_DirectionalLightColor;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightVolumetricScatteringIntensity;
  const uint TranslucentBasePass_Shared_ForwardISR_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_820;
  const float2 TranslucentBasePass_Shared_ForwardISR_DirectionalLightDistanceFadeMAD;
  const uint TranslucentBasePass_Shared_ForwardISR_NumDirectionalLightCascades;
  const int TranslucentBasePass_Shared_ForwardISR_DirectionalLightVSM;
  const int PrePadding_TranslucentBasePass_Shared_ForwardISR_840;
  const int PrePadding_TranslucentBasePass_Shared_ForwardISR_844;
  const float4 TranslucentBasePass_Shared_ForwardISR_CascadeEndDepths;
  const float4x4 TranslucentBasePass_Shared_ForwardISR_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 TranslucentBasePass_Shared_ForwardISR_DirectionalLightShadowmapMinMax[4];
  const float4 TranslucentBasePass_Shared_ForwardISR_DirectionalLightShadowmapAtlasBufferSize;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightDepthBias;
  const uint TranslucentBasePass_Shared_ForwardISR_DirectionalLightUseStaticShadowing;
  const uint TranslucentBasePass_Shared_ForwardISR_SimpleLightsEndIndex;
  const uint TranslucentBasePass_Shared_ForwardISR_ClusteredDeferredSupportedEndIndex;
  const uint TranslucentBasePass_Shared_ForwardISR_LumenSupportedStartIndex;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1220;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1224;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1228;
  const float4 TranslucentBasePass_Shared_ForwardISR_DirectionalLightStaticShadowBufferSize;
  const float4x4 TranslucentBasePass_Shared_ForwardISR_DirectionalLightTranslatedWorldToStaticShadow;
  const uint TranslucentBasePass_Shared_ForwardISR_DirectLightingShowFlag;
  const float PrePadding_TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1316;
  const float PrePadding_TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1320;
  const float PrePadding_TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1324;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_ScreenRayLength;
  const int TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTRayCount;
  const int TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint TranslucentBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1364;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1368;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1372;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_DirectionalLightShadowmapAtlas;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1380;
  const uint BindlessSampler_TranslucentBasePass_Shared_ForwardISR_ShadowmapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1388;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_DirectionalLightStaticShadowmap;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1396;
  const uint BindlessSampler_TranslucentBasePass_Shared_ForwardISR_StaticShadowmapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1404;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_ForwardLocalLightBuffer;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1412;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_NumCulledLightsGrid;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1420;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_CulledLightDataGrid32Bit;
  const uint PrePadding_TranslucentBasePass_Shared_ForwardISR_1428;
  const uint BindlessResource_TranslucentBasePass_Shared_ForwardISR_CulledLightDataGrid16Bit;
  const float PrePadding_TranslucentBasePass_Shared_Reflection_1436;
  const float4 TranslucentBasePass_Shared_Reflection_SkyLightParameters;
  const uint BindlessResource_TranslucentBasePass_Shared_Reflection_SkyLightCubemap;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1460;
  const uint BindlessSampler_TranslucentBasePass_Shared_Reflection_SkyLightCubemapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1468;
  const uint BindlessResource_TranslucentBasePass_Shared_Reflection_SkyLightBlendDestinationCubemap;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1476;
  const uint BindlessSampler_TranslucentBasePass_Shared_Reflection_SkyLightBlendDestinationCubemapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1484;
  const uint BindlessResource_TranslucentBasePass_Shared_Reflection_ReflectionCubemap;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1492;
  const uint BindlessSampler_TranslucentBasePass_Shared_Reflection_ReflectionCubemapSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1500;
  const uint BindlessResource_TranslucentBasePass_Shared_Reflection_PreIntegratedGF;
  const uint PrePadding_TranslucentBasePass_Shared_Reflection_1508;
  const uint BindlessSampler_TranslucentBasePass_Shared_Reflection_PreIntegratedGFSampler;
  const float PrePadding_TranslucentBasePass_Shared_PlanarReflection_1516;
  const float4 TranslucentBasePass_Shared_PlanarReflection_ReflectionPlane;
  const float4 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionOrigin;
  const float4 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionXAxis;
  const float4 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionYAxis;
  const float3x4 TranslucentBasePass_Shared_PlanarReflection_InverseTransposeMirrorMatrix;
  const float3 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionParameters;
  const float PrePadding_TranslucentBasePass_Shared_PlanarReflection_1644;
  const float2 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionParameters2;
  const float PrePadding_TranslucentBasePass_Shared_PlanarReflection_1656;
  const float PrePadding_TranslucentBasePass_Shared_PlanarReflection_1660;
  const float4x4 TranslucentBasePass_Shared_PlanarReflection_ProjectionWithExtraFOV[2];
  const float4 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionScreenScaleBias[2];
  const float2 TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionScreenBound;
  const uint TranslucentBasePass_Shared_PlanarReflection_bIsStereo;
  const uint PrePadding_TranslucentBasePass_Shared_PlanarReflection_1836;
  const uint BindlessResource_TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionTexture;
  const uint PrePadding_TranslucentBasePass_Shared_PlanarReflection_1844;
  const uint BindlessSampler_TranslucentBasePass_Shared_PlanarReflection_PlanarReflectionSampler;
  const float PrePadding_TranslucentBasePass_Shared_Fog_1852;
  const float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters;
  const float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters2;
  const float4 TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter;
  const float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters3;
  const float4 TranslucentBasePass_Shared_Fog_SkyAtmosphereAmbientContributionColorScale;
  const float4 TranslucentBasePass_Shared_Fog_InscatteringLightDirection;
  const float4 TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor;
  const float2 TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_TranslucentBasePass_Shared_Fog_1976;
  const float PrePadding_TranslucentBasePass_Shared_Fog_1980;
  const float3 TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters;
  const float TranslucentBasePass_Shared_Fog_ApplyVolumetricFog;
  const float TranslucentBasePass_Shared_Fog_VolumetricFogStartDistance;
  const float TranslucentBasePass_Shared_Fog_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap;
  const uint PrePadding_TranslucentBasePass_Shared_Fog_2012;
  const uint BindlessSampler_TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler;
  const uint PrePadding_TranslucentBasePass_Shared_Fog_2020;
  const uint BindlessResource_TranslucentBasePass_Shared_Fog_IntegratedLightScattering;
  const uint PrePadding_TranslucentBasePass_Shared_Fog_2028;
  const uint BindlessSampler_TranslucentBasePass_Shared_Fog_IntegratedLightScatteringSampler;
  const float PrePadding_TranslucentBasePass_Shared_FogISR_2036;
  const float PrePadding_TranslucentBasePass_Shared_FogISR_2040;
  const float PrePadding_TranslucentBasePass_Shared_FogISR_2044;
  const float4 TranslucentBasePass_Shared_FogISR_ExponentialFogParameters;
  const float4 TranslucentBasePass_Shared_FogISR_ExponentialFogParameters2;
  const float4 TranslucentBasePass_Shared_FogISR_ExponentialFogColorParameter;
  const float4 TranslucentBasePass_Shared_FogISR_ExponentialFogParameters3;
  const float4 TranslucentBasePass_Shared_FogISR_SkyAtmosphereAmbientContributionColorScale;
  const float4 TranslucentBasePass_Shared_FogISR_InscatteringLightDirection;
  const float4 TranslucentBasePass_Shared_FogISR_DirectionalInscatteringColor;
  const float2 TranslucentBasePass_Shared_FogISR_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_TranslucentBasePass_Shared_FogISR_2168;
  const float PrePadding_TranslucentBasePass_Shared_FogISR_2172;
  const float3 TranslucentBasePass_Shared_FogISR_FogInscatteringTextureParameters;
  const float TranslucentBasePass_Shared_FogISR_ApplyVolumetricFog;
  const float TranslucentBasePass_Shared_FogISR_VolumetricFogStartDistance;
  const float TranslucentBasePass_Shared_FogISR_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_TranslucentBasePass_Shared_FogISR_FogInscatteringColorCubemap;
  const uint PrePadding_TranslucentBasePass_Shared_FogISR_2204;
  const uint BindlessSampler_TranslucentBasePass_Shared_FogISR_FogInscatteringColorSampler;
  const uint PrePadding_TranslucentBasePass_Shared_FogISR_2212;
  const uint BindlessResource_TranslucentBasePass_Shared_FogISR_IntegratedLightScattering;
  const uint PrePadding_TranslucentBasePass_Shared_FogISR_2220;
  const uint BindlessSampler_TranslucentBasePass_Shared_FogISR_IntegratedLightScatteringSampler;
  const float PrePadding_TranslucentBasePass_Shared_2228;
  const float PrePadding_TranslucentBasePass_Shared_2232;
  const float PrePadding_TranslucentBasePass_Shared_2236;
  const uint TranslucentBasePass_Shared_UseBasePassSkylight;
  const float PrePadding_TranslucentBasePass_SceneTextures_2244;
  const float PrePadding_TranslucentBasePass_SceneTextures_2248;
  const float PrePadding_TranslucentBasePass_SceneTextures_2252;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_SceneColorTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2260;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_SceneDepthTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2268;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_ScenePartialDepthTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2276;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferATexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2284;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferBTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2292;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferCTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2300;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferDTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2308;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferETexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2316;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferFTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2324;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_GBufferVelocityTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2332;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_ScreenSpaceAOTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2340;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_CustomDepthTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2348;
  const uint BindlessResource_TranslucentBasePass_SceneTextures_CustomStencilTexture;
  const uint PrePadding_TranslucentBasePass_SceneTextures_2356;
  const uint BindlessSampler_TranslucentBasePass_SceneTextures_PointClampSampler;
  const float PrePadding_TranslucentBasePass_Strata_2364;
  const uint TranslucentBasePass_Strata_MaxBytesPerPixel;
  const uint TranslucentBasePass_Strata_bRoughDiffuse;
  const uint TranslucentBasePass_Strata_PeelLayersAboveDepth;
  const uint TranslucentBasePass_Strata_bRoughnessTracking;
  const int TranslucentBasePass_Strata_FirstSliceStoringStrataSSSData;
  const int PrePadding_TranslucentBasePass_Strata_2388;
  const uint BindlessResource_TranslucentBasePass_Strata_MaterialTextureArray;
  const uint PrePadding_TranslucentBasePass_Strata_2396;
  const uint BindlessResource_TranslucentBasePass_Strata_TopLayerTexture;
  const float PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2404;
  const float PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2408;
  const float PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2412;
  const float4x4 TranslucentBasePass_ForwardDirLightCloudShadow_CloudShadowmapTranslatedWorldToLightClipMatrix;
  const float TranslucentBasePass_ForwardDirLightCloudShadow_CloudShadowmapFarDepthKm;
  const float PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2484;
  const uint BindlessResource_TranslucentBasePass_ForwardDirLightCloudShadow_CloudShadowmapTexture;
  const uint PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2492;
  const uint BindlessSampler_TranslucentBasePass_ForwardDirLightCloudShadow_CloudShadowmapSampler;
  const uint PrePadding_TranslucentBasePass_ForwardDirLightCloudShadow_2500;
  const float TranslucentBasePass_ForwardDirLightCloudShadow_CloudShadowmapStrength;
  const float PrePadding_TranslucentBasePass_OIT_2508;
  const uint TranslucentBasePass_OIT_bOITEnable;
  const uint TranslucentBasePass_OIT_OITMethod;
  const uint TranslucentBasePass_OIT_MaxSideSamplePerPixel;
  const uint TranslucentBasePass_OIT_MaxSamplePerPixel;
  const uint TranslucentBasePass_OIT_TransmittanceThreshold;
  const uint PrePadding_TranslucentBasePass_OIT_2532;
  const uint BindlessResource_TranslucentBasePass_OIT_OutOITSampleCount;
  const uint PrePadding_TranslucentBasePass_OIT_2540;
  const uint BindlessResource_TranslucentBasePass_OIT_OutOITSampleColor;
  const uint PrePadding_TranslucentBasePass_OIT_2548;
  const uint BindlessResource_TranslucentBasePass_OIT_OutOITSampleTrans;
  const uint PrePadding_TranslucentBasePass_OIT_2556;
  const uint BindlessResource_TranslucentBasePass_OIT_OutOITSampleDepth;
  const float PrePadding_TranslucentBasePass_2564;
  const float PrePadding_TranslucentBasePass_2568;
  const float PrePadding_TranslucentBasePass_2572;
  const float4 TranslucentBasePass_HZBUvFactorAndInvFactor;
  const float4 TranslucentBasePass_PrevScreenPositionScaleBias;
  const float2 TranslucentBasePass_PrevSceneColorBilinearUVMin;
  const float2 TranslucentBasePass_PrevSceneColorBilinearUVMax;
  const float TranslucentBasePass_PrevSceneColorPreExposureInv;
  const int TranslucentBasePass_SSRQuality;
  const uint BindlessResource_TranslucentBasePass_HZBTexture;
  const uint PrePadding_TranslucentBasePass_2636;
  const uint BindlessSampler_TranslucentBasePass_HZBSampler;
  const uint PrePadding_TranslucentBasePass_2644;
  const uint BindlessResource_TranslucentBasePass_PrevSceneColor;
  const uint PrePadding_TranslucentBasePass_2652;
  const uint BindlessSampler_TranslucentBasePass_PrevSceneColorSampler;
  const uint PrePadding_TranslucentBasePass_2660;
  const uint BindlessResource_TranslucentBasePass_VolumetricCloudColor;
  const uint PrePadding_TranslucentBasePass_2668;
  const uint BindlessSampler_TranslucentBasePass_VolumetricCloudColorSampler;
  const uint PrePadding_TranslucentBasePass_2676;
  const uint BindlessResource_TranslucentBasePass_VolumetricCloudDepth;
  const uint PrePadding_TranslucentBasePass_2684;
  const uint BindlessSampler_TranslucentBasePass_VolumetricCloudDepthSampler;
  const uint PrePadding_TranslucentBasePass_2692;
  const float TranslucentBasePass_ApplyVolumetricCloudOnTransparent;
  const float TranslucentBasePass_SoftBlendingDistanceKm;
  const uint BindlessResource_TranslucentBasePass_TranslucencyLightingVolumeAmbientInner;
  const uint PrePadding_TranslucentBasePass_2708;
  const uint BindlessResource_TranslucentBasePass_TranslucencyLightingVolumeAmbientOuter;
  const uint PrePadding_TranslucentBasePass_2716;
  const uint BindlessResource_TranslucentBasePass_TranslucencyLightingVolumeDirectionalInner;
  const uint PrePadding_TranslucentBasePass_2724;
  const uint BindlessResource_TranslucentBasePass_TranslucencyLightingVolumeDirectionalOuter;
  const float PrePadding_TranslucentBasePass_2732;
  const float TranslucentBasePass_ReprojectionRadiusScale;
  const float TranslucentBasePass_ClipmapWorldExtent;
  const float TranslucentBasePass_ClipmapDistributionBase;
  const float TranslucentBasePass_InvClipmapFadeSize;
  const int2 TranslucentBasePass_ProbeAtlasResolutionInProbes;
  const uint TranslucentBasePass_RadianceProbeClipmapResolution;
  const uint TranslucentBasePass_NumRadianceProbeClipmaps;
  const uint TranslucentBasePass_RadianceProbeResolution;
  const uint TranslucentBasePass_FinalProbeResolution;
  const uint TranslucentBasePass_FinalRadianceAtlasMaxMip;
  const uint TranslucentBasePass_CalculateIrradiance;
  const uint TranslucentBasePass_IrradianceProbeResolution;
  const uint TranslucentBasePass_OcclusionProbeResolution;
  const uint TranslucentBasePass_NumProbesToTraceBudget;
  const uint TranslucentBasePass_RadianceCacheStats;
  const uint BindlessResource_TranslucentBasePass_RadianceProbeIndirectionTexture;
  const uint PrePadding_TranslucentBasePass_2804;
  const uint BindlessResource_TranslucentBasePass_RadianceCacheFinalRadianceAtlas;
  const uint PrePadding_TranslucentBasePass_2812;
  const uint BindlessResource_TranslucentBasePass_RadianceCacheFinalIrradianceAtlas;
  const uint PrePadding_TranslucentBasePass_2820;
  const uint BindlessResource_TranslucentBasePass_RadianceCacheProbeOcclusionAtlas;
  const uint PrePadding_TranslucentBasePass_2828;
  const uint BindlessResource_TranslucentBasePass_RadianceCacheDepthAtlas;
  const uint PrePadding_TranslucentBasePass_2836;
  const uint BindlessResource_TranslucentBasePass_ProbeWorldOffset;
  const uint PrePadding_TranslucentBasePass_2844;
  const float4 TranslucentBasePass_RadianceProbeSettings[6];
  const float4 TranslucentBasePass_PaddedWorldPositionToRadianceProbeCoordBias[6];
  const float4 TranslucentBasePass_PaddedRadianceProbeCoordToWorldPositionBias[6];
  const float2 TranslucentBasePass_InvProbeFinalRadianceAtlasResolution;
  const float2 TranslucentBasePass_InvProbeFinalIrradianceAtlasResolution;
  const float2 TranslucentBasePass_InvProbeDepthAtlasResolution;
  const uint TranslucentBasePass_OverrideCacheOcclusionLighting;
  const uint TranslucentBasePass_ShowBlackRadianceCacheLighting;
  const uint TranslucentBasePass_ProbeAtlasResolutionModuloMask;
  const uint TranslucentBasePass_ProbeAtlasResolutionDivideShift;
  const float PrePadding_TranslucentBasePass_3176;
  const float PrePadding_TranslucentBasePass_3180;
  const uint BindlessResource_TranslucentBasePass_Radiance;
  const uint PrePadding_TranslucentBasePass_3188;
  const uint BindlessResource_TranslucentBasePass_Normal;
  const uint PrePadding_TranslucentBasePass_3196;
  const uint BindlessResource_TranslucentBasePass_SceneDepth;
  const uint PrePadding_TranslucentBasePass_3204;
  const uint TranslucentBasePass_Enabled;
  const float TranslucentBasePass_RelativeDepthThreshold;
  const float TranslucentBasePass_SpecularScale;
  const float TranslucentBasePass_Contrast;
  const float PrePadding_TranslucentBasePass_3224;
  const float PrePadding_TranslucentBasePass_3228;
  const uint BindlessResource_TranslucentBasePass_TranslucencyGIVolume0;
  const uint PrePadding_TranslucentBasePass_3236;
  const uint BindlessResource_TranslucentBasePass_TranslucencyGIVolume1;
  const uint PrePadding_TranslucentBasePass_3244;
  const uint BindlessResource_TranslucentBasePass_TranslucencyGIVolumeHistory0;
  const uint PrePadding_TranslucentBasePass_3252;
  const uint BindlessResource_TranslucentBasePass_TranslucencyGIVolumeHistory1;
  const uint PrePadding_TranslucentBasePass_3260;
  const uint BindlessSampler_TranslucentBasePass_TranslucencyGIVolumeSampler;
  const uint PrePadding_TranslucentBasePass_3268;
  const uint PrePadding_TranslucentBasePass_3272;
  const uint PrePadding_TranslucentBasePass_3276;
  const float3 TranslucentBasePass_TranslucencyGIGridZParams;
  const uint TranslucentBasePass_TranslucencyGIGridPixelSizeShift;
  const int3 TranslucentBasePass_TranslucencyGIGridSize;
  const float PrePadding_TranslucentBasePass_3308;
  const uint BindlessResource_TranslucentBasePass_PreIntegratedGFTexture;
  const uint PrePadding_TranslucentBasePass_3316;
  const uint BindlessSampler_TranslucentBasePass_PreIntegratedGFSampler;
  const uint PrePadding_TranslucentBasePass_3324;
  const uint BindlessResource_TranslucentBasePass_EyeAdaptationBuffer;
  const uint PrePadding_TranslucentBasePass_3332;
  const uint BindlessResource_TranslucentBasePass_SceneColorCopyTexture;
  const uint PrePadding_TranslucentBasePass_3340;
  const uint BindlessSampler_TranslucentBasePass_SceneColorCopySampler;
  const float PrePadding_TranslucentBasePass_BlueNoise_3348;
  const float PrePadding_TranslucentBasePass_BlueNoise_3352;
  const float PrePadding_TranslucentBasePass_BlueNoise_3356;
  const int3 TranslucentBasePass_BlueNoise_Dimensions;
  const int PrePadding_TranslucentBasePass_BlueNoise_3372;
  const int3 TranslucentBasePass_BlueNoise_ModuloMasks;
  const int PrePadding_TranslucentBasePass_BlueNoise_3388;
  const uint BindlessResource_TranslucentBasePass_BlueNoise_ScalarTexture;
  const uint PrePadding_TranslucentBasePass_BlueNoise_3396;
  const uint BindlessResource_TranslucentBasePass_BlueNoise_Vec2Texture;
}
#line 441 "/Engine/Generated/UniformBuffers/TranslucentBasePass.ush"
TextureCube<vector<float, 4> > TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap;
#line 442 "/Engine/Generated/UniformBuffers/TranslucentBasePass.ush"
SamplerState TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler;
#line 3 "/Engine/Generated/UniformBuffers/BasePass.ush"
cbuffer BasePass {
  const uint BasePass_Forward_NumLocalLights;
  const uint BasePass_Forward_NumReflectionCaptures;
  const uint BasePass_Forward_HasDirectionalLight;
  const uint BasePass_Forward_NumGridCells;
  const int3 BasePass_Forward_CulledGridSize;
  const uint BasePass_Forward_MaxCulledLightsPerCell;
  const uint BasePass_Forward_LightGridPixelSizeShift;
  const uint PrePadding_BasePass_Forward_36;
  const uint PrePadding_BasePass_Forward_40;
  const uint PrePadding_BasePass_Forward_44;
  const float3 BasePass_Forward_LightGridZParams;
  const float PrePadding_BasePass_Forward_60;
  const float3 BasePass_Forward_DirectionalLightDirection;
  const float BasePass_Forward_DirectionalLightSourceRadius;
  const float3 BasePass_Forward_DirectionalLightColor;
  const float BasePass_Forward_DirectionalLightVolumetricScatteringIntensity;
  const uint BasePass_Forward_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_BasePass_Forward_100;
  const float2 BasePass_Forward_DirectionalLightDistanceFadeMAD;
  const uint BasePass_Forward_NumDirectionalLightCascades;
  const int BasePass_Forward_DirectionalLightVSM;
  const int PrePadding_BasePass_Forward_120;
  const int PrePadding_BasePass_Forward_124;
  const float4 BasePass_Forward_CascadeEndDepths;
  const float4x4 BasePass_Forward_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 BasePass_Forward_DirectionalLightShadowmapMinMax[4];
  const float4 BasePass_Forward_DirectionalLightShadowmapAtlasBufferSize;
  const float BasePass_Forward_DirectionalLightDepthBias;
  const uint BasePass_Forward_DirectionalLightUseStaticShadowing;
  const uint BasePass_Forward_SimpleLightsEndIndex;
  const uint BasePass_Forward_ClusteredDeferredSupportedEndIndex;
  const uint BasePass_Forward_LumenSupportedStartIndex;
  const uint PrePadding_BasePass_Forward_500;
  const uint PrePadding_BasePass_Forward_504;
  const uint PrePadding_BasePass_Forward_508;
  const float4 BasePass_Forward_DirectionalLightStaticShadowBufferSize;
  const float4x4 BasePass_Forward_DirectionalLightTranslatedWorldToStaticShadow;
  const uint BasePass_Forward_DirectLightingShowFlag;
  const float PrePadding_BasePass_Forward_DirectionalLightSMRTSettings_596;
  const float PrePadding_BasePass_Forward_DirectionalLightSMRTSettings_600;
  const float PrePadding_BasePass_Forward_DirectionalLightSMRTSettings_604;
  const float BasePass_Forward_DirectionalLightSMRTSettings_ScreenRayLength;
  const int BasePass_Forward_DirectionalLightSMRTSettings_SMRTRayCount;
  const int BasePass_Forward_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float BasePass_Forward_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float BasePass_Forward_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float BasePass_Forward_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float BasePass_Forward_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float BasePass_Forward_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint BasePass_Forward_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_BasePass_Forward_644;
  const uint PrePadding_BasePass_Forward_648;
  const uint PrePadding_BasePass_Forward_652;
  const uint BindlessResource_BasePass_Forward_DirectionalLightShadowmapAtlas;
  const uint PrePadding_BasePass_Forward_660;
  const uint BindlessSampler_BasePass_Forward_ShadowmapSampler;
  const uint PrePadding_BasePass_Forward_668;
  const uint BindlessResource_BasePass_Forward_DirectionalLightStaticShadowmap;
  const uint PrePadding_BasePass_Forward_676;
  const uint BindlessSampler_BasePass_Forward_StaticShadowmapSampler;
  const uint PrePadding_BasePass_Forward_684;
  const uint BindlessResource_BasePass_Forward_ForwardLocalLightBuffer;
  const uint PrePadding_BasePass_Forward_692;
  const uint BindlessResource_BasePass_Forward_NumCulledLightsGrid;
  const uint PrePadding_BasePass_Forward_700;
  const uint BindlessResource_BasePass_Forward_CulledLightDataGrid32Bit;
  const uint PrePadding_BasePass_Forward_708;
  const uint BindlessResource_BasePass_Forward_CulledLightDataGrid16Bit;
  const float PrePadding_BasePass_ForwardISR_716;
  const uint BasePass_ForwardISR_NumLocalLights;
  const uint BasePass_ForwardISR_NumReflectionCaptures;
  const uint BasePass_ForwardISR_HasDirectionalLight;
  const uint BasePass_ForwardISR_NumGridCells;
  const int3 BasePass_ForwardISR_CulledGridSize;
  const uint BasePass_ForwardISR_MaxCulledLightsPerCell;
  const uint BasePass_ForwardISR_LightGridPixelSizeShift;
  const uint PrePadding_BasePass_ForwardISR_756;
  const uint PrePadding_BasePass_ForwardISR_760;
  const uint PrePadding_BasePass_ForwardISR_764;
  const float3 BasePass_ForwardISR_LightGridZParams;
  const float PrePadding_BasePass_ForwardISR_780;
  const float3 BasePass_ForwardISR_DirectionalLightDirection;
  const float BasePass_ForwardISR_DirectionalLightSourceRadius;
  const float3 BasePass_ForwardISR_DirectionalLightColor;
  const float BasePass_ForwardISR_DirectionalLightVolumetricScatteringIntensity;
  const uint BasePass_ForwardISR_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_BasePass_ForwardISR_820;
  const float2 BasePass_ForwardISR_DirectionalLightDistanceFadeMAD;
  const uint BasePass_ForwardISR_NumDirectionalLightCascades;
  const int BasePass_ForwardISR_DirectionalLightVSM;
  const int PrePadding_BasePass_ForwardISR_840;
  const int PrePadding_BasePass_ForwardISR_844;
  const float4 BasePass_ForwardISR_CascadeEndDepths;
  const float4x4 BasePass_ForwardISR_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 BasePass_ForwardISR_DirectionalLightShadowmapMinMax[4];
  const float4 BasePass_ForwardISR_DirectionalLightShadowmapAtlasBufferSize;
  const float BasePass_ForwardISR_DirectionalLightDepthBias;
  const uint BasePass_ForwardISR_DirectionalLightUseStaticShadowing;
  const uint BasePass_ForwardISR_SimpleLightsEndIndex;
  const uint BasePass_ForwardISR_ClusteredDeferredSupportedEndIndex;
  const uint BasePass_ForwardISR_LumenSupportedStartIndex;
  const uint PrePadding_BasePass_ForwardISR_1220;
  const uint PrePadding_BasePass_ForwardISR_1224;
  const uint PrePadding_BasePass_ForwardISR_1228;
  const float4 BasePass_ForwardISR_DirectionalLightStaticShadowBufferSize;
  const float4x4 BasePass_ForwardISR_DirectionalLightTranslatedWorldToStaticShadow;
  const uint BasePass_ForwardISR_DirectLightingShowFlag;
  const float PrePadding_BasePass_ForwardISR_DirectionalLightSMRTSettings_1316;
  const float PrePadding_BasePass_ForwardISR_DirectionalLightSMRTSettings_1320;
  const float PrePadding_BasePass_ForwardISR_DirectionalLightSMRTSettings_1324;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_ScreenRayLength;
  const int BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTRayCount;
  const int BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint BasePass_ForwardISR_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_BasePass_ForwardISR_1364;
  const uint PrePadding_BasePass_ForwardISR_1368;
  const uint PrePadding_BasePass_ForwardISR_1372;
  const uint BindlessResource_BasePass_ForwardISR_DirectionalLightShadowmapAtlas;
  const uint PrePadding_BasePass_ForwardISR_1380;
  const uint BindlessSampler_BasePass_ForwardISR_ShadowmapSampler;
  const uint PrePadding_BasePass_ForwardISR_1388;
  const uint BindlessResource_BasePass_ForwardISR_DirectionalLightStaticShadowmap;
  const uint PrePadding_BasePass_ForwardISR_1396;
  const uint BindlessSampler_BasePass_ForwardISR_StaticShadowmapSampler;
  const uint PrePadding_BasePass_ForwardISR_1404;
  const uint BindlessResource_BasePass_ForwardISR_ForwardLocalLightBuffer;
  const uint PrePadding_BasePass_ForwardISR_1412;
  const uint BindlessResource_BasePass_ForwardISR_NumCulledLightsGrid;
  const uint PrePadding_BasePass_ForwardISR_1420;
  const uint BindlessResource_BasePass_ForwardISR_CulledLightDataGrid32Bit;
  const uint PrePadding_BasePass_ForwardISR_1428;
  const uint BindlessResource_BasePass_ForwardISR_CulledLightDataGrid16Bit;
  const float PrePadding_BasePass_Reflection_1436;
  const float4 BasePass_Reflection_SkyLightParameters;
  const uint BindlessResource_BasePass_Reflection_SkyLightCubemap;
  const uint PrePadding_BasePass_Reflection_1460;
  const uint BindlessSampler_BasePass_Reflection_SkyLightCubemapSampler;
  const uint PrePadding_BasePass_Reflection_1468;
  const uint BindlessResource_BasePass_Reflection_SkyLightBlendDestinationCubemap;
  const uint PrePadding_BasePass_Reflection_1476;
  const uint BindlessSampler_BasePass_Reflection_SkyLightBlendDestinationCubemapSampler;
  const uint PrePadding_BasePass_Reflection_1484;
  const uint BindlessResource_BasePass_Reflection_ReflectionCubemap;
  const uint PrePadding_BasePass_Reflection_1492;
  const uint BindlessSampler_BasePass_Reflection_ReflectionCubemapSampler;
  const uint PrePadding_BasePass_Reflection_1500;
  const uint BindlessResource_BasePass_Reflection_PreIntegratedGF;
  const uint PrePadding_BasePass_Reflection_1508;
  const uint BindlessSampler_BasePass_Reflection_PreIntegratedGFSampler;
  const float PrePadding_BasePass_PlanarReflection_1516;
  const float4 BasePass_PlanarReflection_ReflectionPlane;
  const float4 BasePass_PlanarReflection_PlanarReflectionOrigin;
  const float4 BasePass_PlanarReflection_PlanarReflectionXAxis;
  const float4 BasePass_PlanarReflection_PlanarReflectionYAxis;
  const float3x4 BasePass_PlanarReflection_InverseTransposeMirrorMatrix;
  const float3 BasePass_PlanarReflection_PlanarReflectionParameters;
  const float PrePadding_BasePass_PlanarReflection_1644;
  const float2 BasePass_PlanarReflection_PlanarReflectionParameters2;
  const float PrePadding_BasePass_PlanarReflection_1656;
  const float PrePadding_BasePass_PlanarReflection_1660;
  const float4x4 BasePass_PlanarReflection_ProjectionWithExtraFOV[2];
  const float4 BasePass_PlanarReflection_PlanarReflectionScreenScaleBias[2];
  const float2 BasePass_PlanarReflection_PlanarReflectionScreenBound;
  const uint BasePass_PlanarReflection_bIsStereo;
  const uint PrePadding_BasePass_PlanarReflection_1836;
  const uint BindlessResource_BasePass_PlanarReflection_PlanarReflectionTexture;
  const uint PrePadding_BasePass_PlanarReflection_1844;
  const uint BindlessSampler_BasePass_PlanarReflection_PlanarReflectionSampler;
  const float PrePadding_BasePass_Fog_1852;
  const float4 BasePass_Fog_ExponentialFogParameters;
  const float4 BasePass_Fog_ExponentialFogParameters2;
  const float4 BasePass_Fog_ExponentialFogColorParameter;
  const float4 BasePass_Fog_ExponentialFogParameters3;
  const float4 BasePass_Fog_SkyAtmosphereAmbientContributionColorScale;
  const float4 BasePass_Fog_InscatteringLightDirection;
  const float4 BasePass_Fog_DirectionalInscatteringColor;
  const float2 BasePass_Fog_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_BasePass_Fog_1976;
  const float PrePadding_BasePass_Fog_1980;
  const float3 BasePass_Fog_FogInscatteringTextureParameters;
  const float BasePass_Fog_ApplyVolumetricFog;
  const float BasePass_Fog_VolumetricFogStartDistance;
  const float BasePass_Fog_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_BasePass_Fog_FogInscatteringColorCubemap;
  const uint PrePadding_BasePass_Fog_2012;
  const uint BindlessSampler_BasePass_Fog_FogInscatteringColorSampler;
  const uint PrePadding_BasePass_Fog_2020;
  const uint BindlessResource_BasePass_Fog_IntegratedLightScattering;
  const uint PrePadding_BasePass_Fog_2028;
  const uint BindlessSampler_BasePass_Fog_IntegratedLightScatteringSampler;
  const float PrePadding_BasePass_FogISR_2036;
  const float PrePadding_BasePass_FogISR_2040;
  const float PrePadding_BasePass_FogISR_2044;
  const float4 BasePass_FogISR_ExponentialFogParameters;
  const float4 BasePass_FogISR_ExponentialFogParameters2;
  const float4 BasePass_FogISR_ExponentialFogColorParameter;
  const float4 BasePass_FogISR_ExponentialFogParameters3;
  const float4 BasePass_FogISR_SkyAtmosphereAmbientContributionColorScale;
  const float4 BasePass_FogISR_InscatteringLightDirection;
  const float4 BasePass_FogISR_DirectionalInscatteringColor;
  const float2 BasePass_FogISR_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_BasePass_FogISR_2168;
  const float PrePadding_BasePass_FogISR_2172;
  const float3 BasePass_FogISR_FogInscatteringTextureParameters;
  const float BasePass_FogISR_ApplyVolumetricFog;
  const float BasePass_FogISR_VolumetricFogStartDistance;
  const float BasePass_FogISR_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_BasePass_FogISR_FogInscatteringColorCubemap;
  const uint PrePadding_BasePass_FogISR_2204;
  const uint BindlessSampler_BasePass_FogISR_FogInscatteringColorSampler;
  const uint PrePadding_BasePass_FogISR_2212;
  const uint BindlessResource_BasePass_FogISR_IntegratedLightScattering;
  const uint PrePadding_BasePass_FogISR_2220;
  const uint BindlessSampler_BasePass_FogISR_IntegratedLightScatteringSampler;
  const float PrePadding_BasePass_2228;
  const float PrePadding_BasePass_2232;
  const float PrePadding_BasePass_2236;
  const uint BasePass_UseBasePassSkylight;
}
#line 3 "/Engine/Generated/UniformBuffers/View.ush"
cbuffer View {
  const float4x4 View_TranslatedWorldToClip;
  const float4x4 View_RelativeWorldToClip;
  const float4x4 View_ClipToRelativeWorld;
  const float4x4 View_TranslatedWorldToView;
  const float4x4 View_ViewToTranslatedWorld;
  const float4x4 View_TranslatedWorldToCameraView;
  const float4x4 View_CameraViewToTranslatedWorld;
  const float4x4 View_ViewToClip;
  const float4x4 View_ViewToClipNoAA;
  const float4x4 View_ClipToView;
  const float4x4 View_ClipToTranslatedWorld;
  const float4x4 View_SVPositionToTranslatedWorld;
  const float4x4 View_ScreenToRelativeWorld;
  const float4x4 View_ScreenToTranslatedWorld;
  const float4x4 View_MobileMultiviewShadowTransform;
  const float3 View_ViewTilePosition;
  const float PrePadding_View_972;
  const float3 View_MatrixTilePosition;
  const float PrePadding_View_988;
  const float3 View_ViewForward;
  const float PrePadding_View_1004;
  const float3 View_ViewUp;
  const float PrePadding_View_1020;
  const float3 View_ViewRight;
  const float PrePadding_View_1036;
  const float3 View_HMDViewNoRollUp;
  const float PrePadding_View_1052;
  const float3 View_HMDViewNoRollRight;
  const float PrePadding_View_1068;
  const float4 View_InvDeviceZToWorldZTransform;
  const float4 View_ScreenPositionScaleBias;
  const float3 View_RelativeWorldCameraOrigin;
  const float PrePadding_View_1116;
  const float3 View_TranslatedWorldCameraOrigin;
  const float PrePadding_View_1132;
  const float3 View_RelativeWorldViewOrigin;
  const float PrePadding_View_1148;
  const float3 View_RelativePreViewTranslation;
  const float PrePadding_View_1164;
  const float4x4 View_PrevViewToClip;
  const float4x4 View_PrevClipToView;
  const float4x4 View_PrevTranslatedWorldToClip;
  const float4x4 View_PrevTranslatedWorldToView;
  const float4x4 View_PrevViewToTranslatedWorld;
  const float4x4 View_PrevTranslatedWorldToCameraView;
  const float4x4 View_PrevCameraViewToTranslatedWorld;
  const float3 View_PrevTranslatedWorldCameraOrigin;
  const float PrePadding_View_1628;
  const float3 View_PrevRelativeWorldCameraOrigin;
  const float PrePadding_View_1644;
  const float3 View_PrevRelativeWorldViewOrigin;
  const float PrePadding_View_1660;
  const float3 View_RelativePrevPreViewTranslation;
  const float PrePadding_View_1676;
  const float4x4 View_PrevClipToRelativeWorld;
  const float4x4 View_PrevScreenToTranslatedWorld;
  const float4x4 View_ClipToPrevClip;
  const float4x4 View_ClipToPrevClipWithAA;
  const float4 View_TemporalAAJitter;
  const float4 View_GlobalClippingPlane;
  const float2 View_FieldOfViewWideAngles;
  const float2 View_PrevFieldOfViewWideAngles;
  const float4 View_ViewRectMin;
  const float4 View_ViewSizeAndInvSize;
  const uint4 View_ViewRectMinAndSize;
  const float4 View_LightProbeSizeRatioAndInvSizeRatio;
  const float4 View_BufferSizeAndInvSize;
  const float4 View_BufferBilinearUVMinMax;
  const float4 View_ScreenToViewSpace;
  const float2 View_BufferToSceneTextureScale;
  const float2 View_ResolutionFractionAndInv;
  const int View_NumSceneColorMSAASamples;
  const float View_ProjectionDepthThicknessScale;
  const float View_PreExposure;
  const float View_OneOverPreExposure;
  const float4 View_DiffuseOverrideParameter;
  const float4 View_SpecularOverrideParameter;
  const float4 View_NormalOverrideParameter;
  const float2 View_RoughnessOverrideParameter;
  const float View_PrevFrameGameTime;
  const float View_PrevFrameRealTime;
  const float View_OutOfBoundsMask;
  const float PrePadding_View_2196;
  const float PrePadding_View_2200;
  const float PrePadding_View_2204;
  const float3 View_WorldCameraMovementSinceLastFrame;
  const float View_CullingSign;
  const float View_NearPlane;
  const float View_GameTime;
  const float View_RealTime;
  const float View_DeltaTime;
  const float View_MaterialTextureMipBias;
  const float View_MaterialTextureDerivativeMultiply;
  const uint View_Random;
  const uint View_FrameNumber;
  const uint View_FrameCounter;
  const uint View_StateFrameIndexMod8;
  const uint View_StateFrameIndex;
  const uint View_DebugViewModeMask;
  const uint View_WorldIsPaused;
  const float View_CameraCut;
  const float View_UnlitViewmodeMask;
  const float PrePadding_View_2284;
  const float4 View_DirectionalLightColor;
  const float3 View_DirectionalLightDirection;
  const float PrePadding_View_2316;
  const float4 View_TranslucencyLightingVolumeMin[2];
  const float4 View_TranslucencyLightingVolumeInvSize[2];
  const float4 View_TemporalAAParams;
  const float4 View_CircleDOFParams;
  const float View_DepthOfFieldSensorWidth;
  const float View_DepthOfFieldFocalDistance;
  const float View_DepthOfFieldScale;
  const float View_DepthOfFieldFocalLength;
  const float View_DepthOfFieldFocalRegion;
  const float View_DepthOfFieldNearTransitionRegion;
  const float View_DepthOfFieldFarTransitionRegion;
  const float View_MotionBlurNormalizedToPixel;
  const float View_GeneralPurposeTweak;
  const float View_GeneralPurposeTweak2;
  const float View_DemosaicVposOffset;
  const float View_DecalDepthBias;
  const float3 View_IndirectLightingColorScale;
  const float PrePadding_View_2476;
  const float3 View_PrecomputedIndirectLightingColorScale;
  const float PrePadding_View_2492;
  const float3 View_PrecomputedIndirectSpecularColorScale;
  const float PrePadding_View_2508;
  const float4 View_AtmosphereLightDirection[2];
  const float4 View_AtmosphereLightIlluminanceOnGroundPostTransmittance[2];
  const float4 View_AtmosphereLightIlluminanceOuterSpace[2];
  const float4 View_AtmosphereLightDiscLuminance[2];
  const float4 View_AtmosphereLightDiscCosHalfApexAngle_PPTrans[2];
  const float4 View_SkyViewLutSizeAndInvSize;
  const float3 View_SkyCameraTranslatedWorldOrigin;
  const float PrePadding_View_2700;
  const float4 View_SkyPlanetTranslatedWorldCenterAndViewHeight;
  const float4x4 View_SkyViewLutReferential;
  const float4 View_SkyAtmosphereSkyLuminanceFactor;
  const float View_SkyAtmospherePresentInScene;
  const float View_SkyAtmosphereHeightFogContribution;
  const float View_SkyAtmosphereBottomRadiusKm;
  const float View_SkyAtmosphereTopRadiusKm;
  const float4 View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
  const float View_SkyAtmosphereAerialPerspectiveStartDepthKm;
  const float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
  const float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
  const float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm;
  const float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
  const float View_SkyAtmosphereApplyCameraAerialPerspectiveVolume;
  const float PrePadding_View_2856;
  const float PrePadding_View_2860;
  const float3 View_NormalCurvatureToRoughnessScaleBias;
  const float View_RenderingReflectionCaptureMask;
  const float View_RealTimeReflectionCapture;
  const float View_RealTimeReflectionCapturePreExposure;
  const float PrePadding_View_2888;
  const float PrePadding_View_2892;
  const float4 View_AmbientCubemapTint;
  const float View_AmbientCubemapIntensity;
  const float View_SkyLightApplyPrecomputedBentNormalShadowingFlag;
  const float View_SkyLightAffectReflectionFlag;
  const float View_SkyLightAffectGlobalIlluminationFlag;
  const float4 View_SkyLightColor;
  const float4 View_MobileSkyIrradianceEnvironmentMap[8];
  const float View_MobilePreviewMode;
  const float View_HMDEyePaddingOffset;
  const float View_ReflectionCubemapMaxMip;
  const float View_ShowDecalsMask;
  const uint View_DistanceFieldAOSpecularOcclusionMode;
  const float View_IndirectCapsuleSelfShadowingIntensity;
  const float PrePadding_View_3096;
  const float PrePadding_View_3100;
  const float3 View_ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
  const int View_StereoPassIndex;
  const float4 View_GlobalVolumeTranslatedCenterAndExtent[6];
  const float4 View_GlobalVolumeTranslatedWorldToUVAddAndMul[6];
  const float4 View_GlobalDistanceFieldMipTranslatedWorldToUVScale[6];
  const float4 View_GlobalDistanceFieldMipTranslatedWorldToUVBias[6];
  const float View_GlobalDistanceFieldMipFactor;
  const float View_GlobalDistanceFieldMipTransition;
  const int View_GlobalDistanceFieldClipmapSizeInPages;
  const int PrePadding_View_3516;
  const float3 View_GlobalDistanceFieldInvPageAtlasSize;
  const float PrePadding_View_3532;
  const float3 View_GlobalDistanceFieldInvCoverageAtlasSize;
  const float View_GlobalVolumeDimension;
  const float View_GlobalVolumeTexelSize;
  const float View_MaxGlobalDFAOConeDistance;
  const uint View_NumGlobalSDFClipmaps;
  const float View_CoveredExpandSurfaceScale;
  const float View_NotCoveredExpandSurfaceScale;
  const float View_NotCoveredMinStepScale;
  const float View_DitheredTransparencyStepThreshold;
  const float View_DitheredTransparencyTraceThreshold;
  const int2 View_CursorPosition;
  const float View_bCheckerboardSubsurfaceProfileRendering;
  const float PrePadding_View_3596;
  const float3 View_VolumetricFogInvGridSize;
  const float PrePadding_View_3612;
  const float3 View_VolumetricFogGridZParams;
  const float PrePadding_View_3628;
  const float2 View_VolumetricFogSVPosToVolumeUV;
  const float2 View_VolumetricFogViewGridUVToPrevViewRectUV;
  const float2 View_VolumetricFogPrevViewGridRectUVToResourceUV;
  const float2 View_VolumetricFogPrevUVMax;
  const float2 View_VolumetricFogScreenToResourceUV;
  const float2 View_VolumetricFogUVMax;
  const float View_VolumetricFogMaxDistance;
  const float PrePadding_View_3684;
  const float PrePadding_View_3688;
  const float PrePadding_View_3692;
  const float3 View_VolumetricLightmapWorldToUVScale;
  const float PrePadding_View_3708;
  const float3 View_VolumetricLightmapWorldToUVAdd;
  const float PrePadding_View_3724;
  const float3 View_VolumetricLightmapIndirectionTextureSize;
  const float View_VolumetricLightmapBrickSize;
  const float3 View_VolumetricLightmapBrickTexelSize;
  const float View_IndirectLightingCacheShowFlag;
  const float View_EyeToPixelSpreadAngle;
  const float PrePadding_View_3764;
  const float PrePadding_View_3768;
  const float PrePadding_View_3772;
  const float4 View_XRPassthroughCameraUVs[2];
  const float View_GlobalVirtualTextureMipBias;
  const uint View_VirtualTextureFeedbackShift;
  const uint View_VirtualTextureFeedbackMask;
  const uint View_VirtualTextureFeedbackStride;
  const uint View_VirtualTextureFeedbackJitterOffset;
  const uint View_VirtualTextureFeedbackSampleOffset;
  const uint PrePadding_View_3832;
  const uint PrePadding_View_3836;
  const float4 View_RuntimeVirtualTextureMipLevel;
  const float2 View_RuntimeVirtualTexturePackHeight;
  const float PrePadding_View_3864;
  const float PrePadding_View_3868;
  const float4 View_RuntimeVirtualTextureDebugParams;
  const float View_OverrideLandscapeLOD;
  const int View_FarShadowStaticMeshLODBias;
  const float View_MinRoughness;
  const float PrePadding_View_3900;
  const float4 View_HairRenderInfo;
  const uint View_EnableSkyLight;
  const uint View_HairRenderInfoBits;
  const uint View_HairComponents;
  const float View_bSubsurfacePostprocessEnabled;
  const float4 View_SSProfilesTextureSizeAndInvSize;
  const float4 View_SSProfilesPreIntegratedTextureSizeAndInvSize;
  const float4 View_SpecularProfileTextureSizeAndInvSize;
  const float3 View_PhysicsFieldClipmapCenter;
  const float View_PhysicsFieldClipmapDistance;
  const int View_PhysicsFieldClipmapResolution;
  const int View_PhysicsFieldClipmapExponent;
  const int View_PhysicsFieldClipmapCount;
  const int View_PhysicsFieldTargetCount;
  const int4 View_PhysicsFieldTargets[32];
  const uint View_GPUSceneViewId;
  const float View_ViewResolutionFraction;
  const float View_SubSurfaceColorAsTransmittanceAtDistanceInMeters;
  const float PrePadding_View_4540;
  const float4 View_TanAndInvTanHalfFOV;
  const float4 View_PrevTanAndInvTanHalfFOV;
  const float4 View_GlintLUTParameters0;
  const float4 View_GlintLUTParameters1;
  const uint BindlessSampler_View_MaterialTextureBilinearWrapedSampler;
  const uint PrePadding_View_4612;
  const uint BindlessSampler_View_MaterialTextureBilinearClampedSampler;
  const uint PrePadding_View_4620;
  const uint BindlessResource_View_VolumetricLightmapIndirectionTexture;
  const uint PrePadding_View_4628;
  const uint BindlessResource_View_VolumetricLightmapBrickAmbientVector;
  const uint PrePadding_View_4636;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients0;
  const uint PrePadding_View_4644;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients1;
  const uint PrePadding_View_4652;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients2;
  const uint PrePadding_View_4660;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients3;
  const uint PrePadding_View_4668;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients4;
  const uint PrePadding_View_4676;
  const uint BindlessResource_View_VolumetricLightmapBrickSHCoefficients5;
  const uint PrePadding_View_4684;
  const uint BindlessResource_View_SkyBentNormalBrickTexture;
  const uint PrePadding_View_4692;
  const uint BindlessResource_View_DirectionalLightShadowingBrickTexture;
  const uint PrePadding_View_4700;
  const uint BindlessSampler_View_VolumetricLightmapBrickAmbientVectorSampler;
  const uint PrePadding_View_4708;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler0;
  const uint PrePadding_View_4716;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler1;
  const uint PrePadding_View_4724;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler2;
  const uint PrePadding_View_4732;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler3;
  const uint PrePadding_View_4740;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler4;
  const uint PrePadding_View_4748;
  const uint BindlessSampler_View_VolumetricLightmapTextureSampler5;
  const uint PrePadding_View_4756;
  const uint BindlessSampler_View_SkyBentNormalTextureSampler;
  const uint PrePadding_View_4764;
  const uint BindlessSampler_View_DirectionalLightShadowingTextureSampler;
  const uint PrePadding_View_4772;
  const uint BindlessResource_View_GlobalDistanceFieldPageAtlasTexture;
  const uint PrePadding_View_4780;
  const uint BindlessResource_View_GlobalDistanceFieldCoverageAtlasTexture;
  const uint PrePadding_View_4788;
  const uint BindlessResource_View_GlobalDistanceFieldPageTableTexture;
  const uint PrePadding_View_4796;
  const uint BindlessResource_View_GlobalDistanceFieldMipTexture;
  const uint PrePadding_View_4804;
  const uint BindlessSampler_View_GlobalDistanceFieldPageAtlasTextureSampler;
  const uint PrePadding_View_4812;
  const uint BindlessSampler_View_GlobalDistanceFieldCoverageAtlasTextureSampler;
  const uint PrePadding_View_4820;
  const uint BindlessSampler_View_GlobalDistanceFieldMipTextureSampler;
  const uint PrePadding_View_4828;
  const uint BindlessResource_View_AtmosphereTransmittanceTexture;
  const uint PrePadding_View_4836;
  const uint BindlessSampler_View_AtmosphereTransmittanceTextureSampler;
  const uint PrePadding_View_4844;
  const uint BindlessResource_View_AtmosphereIrradianceTexture;
  const uint PrePadding_View_4852;
  const uint BindlessSampler_View_AtmosphereIrradianceTextureSampler;
  const uint PrePadding_View_4860;
  const uint BindlessResource_View_AtmosphereInscatterTexture;
  const uint PrePadding_View_4868;
  const uint BindlessSampler_View_AtmosphereInscatterTextureSampler;
  const uint PrePadding_View_4876;
  const uint BindlessResource_View_PerlinNoiseGradientTexture;
  const uint PrePadding_View_4884;
  const uint BindlessSampler_View_PerlinNoiseGradientTextureSampler;
  const uint PrePadding_View_4892;
  const uint BindlessResource_View_PerlinNoise3DTexture;
  const uint PrePadding_View_4900;
  const uint BindlessSampler_View_PerlinNoise3DTextureSampler;
  const uint PrePadding_View_4908;
  const uint BindlessResource_View_SobolSamplingTexture;
  const uint PrePadding_View_4916;
  const uint BindlessSampler_View_SharedPointWrappedSampler;
  const uint PrePadding_View_4924;
  const uint BindlessSampler_View_SharedPointClampedSampler;
  const uint PrePadding_View_4932;
  const uint BindlessSampler_View_SharedBilinearWrappedSampler;
  const uint PrePadding_View_4940;
  const uint BindlessSampler_View_SharedBilinearClampedSampler;
  const uint PrePadding_View_4948;
  const uint BindlessSampler_View_SharedBilinearAnisoClampedSampler;
  const uint PrePadding_View_4956;
  const uint BindlessSampler_View_SharedTrilinearWrappedSampler;
  const uint PrePadding_View_4964;
  const uint BindlessSampler_View_SharedTrilinearClampedSampler;
  const uint PrePadding_View_4972;
  const uint BindlessResource_View_PreIntegratedBRDF;
  const uint PrePadding_View_4980;
  const uint BindlessSampler_View_PreIntegratedBRDFSampler;
  const uint PrePadding_View_4988;
  const uint BindlessResource_View_SkyIrradianceEnvironmentMap;
  const uint PrePadding_View_4996;
  const uint BindlessResource_View_TransmittanceLutTexture;
  const uint PrePadding_View_5004;
  const uint BindlessSampler_View_TransmittanceLutTextureSampler;
  const uint PrePadding_View_5012;
  const uint BindlessResource_View_SkyViewLutTexture;
  const uint PrePadding_View_5020;
  const uint BindlessSampler_View_SkyViewLutTextureSampler;
  const uint PrePadding_View_5028;
  const uint BindlessResource_View_DistantSkyLightLutTexture;
  const uint PrePadding_View_5036;
  const uint BindlessSampler_View_DistantSkyLightLutTextureSampler;
  const uint PrePadding_View_5044;
  const uint BindlessResource_View_CameraAerialPerspectiveVolume;
  const uint PrePadding_View_5052;
  const uint BindlessSampler_View_CameraAerialPerspectiveVolumeSampler;
  const uint PrePadding_View_5060;
  const uint BindlessResource_View_CameraAerialPerspectiveVolumeMieOnly;
  const uint PrePadding_View_5068;
  const uint BindlessSampler_View_CameraAerialPerspectiveVolumeMieOnlySampler;
  const uint PrePadding_View_5076;
  const uint BindlessResource_View_CameraAerialPerspectiveVolumeRayOnly;
  const uint PrePadding_View_5084;
  const uint BindlessSampler_View_CameraAerialPerspectiveVolumeRayOnlySampler;
  const uint PrePadding_View_5092;
  const uint BindlessResource_View_HairScatteringLUTTexture;
  const uint PrePadding_View_5100;
  const uint BindlessSampler_View_HairScatteringLUTSampler;
  const uint PrePadding_View_5108;
  const uint BindlessResource_View_GGXLTCMatTexture;
  const uint PrePadding_View_5116;
  const uint BindlessSampler_View_GGXLTCMatSampler;
  const uint PrePadding_View_5124;
  const uint BindlessResource_View_GGXLTCAmpTexture;
  const uint PrePadding_View_5132;
  const uint BindlessSampler_View_GGXLTCAmpSampler;
  const uint PrePadding_View_5140;
  const uint BindlessResource_View_SheenLTCTexture;
  const uint PrePadding_View_5148;
  const uint BindlessSampler_View_SheenLTCSampler;
  const uint PrePadding_View_5156;
  const uint View_bShadingEnergyConservation;
  const uint View_bShadingEnergyPreservation;
  const uint BindlessResource_View_ShadingEnergyGGXSpecTexture;
  const uint PrePadding_View_5172;
  const uint BindlessResource_View_ShadingEnergyGGXGlassTexture;
  const uint PrePadding_View_5180;
  const uint BindlessResource_View_ShadingEnergyClothSpecTexture;
  const uint PrePadding_View_5188;
  const uint BindlessResource_View_ShadingEnergyDiffuseTexture;
  const uint PrePadding_View_5196;
  const uint BindlessSampler_View_ShadingEnergySampler;
  const uint PrePadding_View_5204;
  const uint BindlessResource_View_GlintTexture;
  const uint PrePadding_View_5212;
  const uint BindlessSampler_View_GlintSampler;
  const uint PrePadding_View_5220;
  const uint BindlessResource_View_SimpleVolumeTexture;
  const uint PrePadding_View_5228;
  const uint BindlessSampler_View_SimpleVolumeTextureSampler;
  const uint PrePadding_View_5236;
  const uint BindlessResource_View_SimpleVolumeEnvTexture;
  const uint PrePadding_View_5244;
  const uint BindlessSampler_View_SimpleVolumeEnvTextureSampler;
  const uint PrePadding_View_5252;
  const uint BindlessResource_View_SSProfilesTexture;
  const uint PrePadding_View_5260;
  const uint BindlessSampler_View_SSProfilesSampler;
  const uint PrePadding_View_5268;
  const uint BindlessSampler_View_SSProfilesTransmissionSampler;
  const uint PrePadding_View_5276;
  const uint BindlessResource_View_SSProfilesPreIntegratedTexture;
  const uint PrePadding_View_5284;
  const uint BindlessSampler_View_SSProfilesPreIntegratedSampler;
  const uint PrePadding_View_5292;
  const uint BindlessResource_View_SpecularProfileTexture;
  const uint PrePadding_View_5300;
  const uint BindlessSampler_View_SpecularProfileSampler;
  const uint PrePadding_View_5308;
  const uint BindlessResource_View_WaterIndirection;
  const uint PrePadding_View_5316;
  const uint BindlessResource_View_WaterData;
  const uint PrePadding_View_5324;
  const float4 View_RectLightAtlasSizeAndInvSize;
  const float View_RectLightAtlasMaxMipLevel;
  const float PrePadding_View_5348;
  const uint BindlessResource_View_RectLightAtlasTexture;
  const uint PrePadding_View_5356;
  const uint BindlessSampler_View_RectLightAtlasSampler;
  const uint PrePadding_View_5364;
  const uint PrePadding_View_5368;
  const uint PrePadding_View_5372;
  const float4 View_IESAtlasSizeAndInvSize;
  const uint BindlessResource_View_IESAtlasTexture;
  const uint PrePadding_View_5396;
  const uint BindlessSampler_View_IESAtlasSampler;
  const uint PrePadding_View_5404;
  const uint BindlessSampler_View_LandscapeWeightmapSampler;
  const uint PrePadding_View_5412;
  const uint BindlessResource_View_LandscapeIndirection;
  const uint PrePadding_View_5420;
  const uint BindlessResource_View_LandscapePerComponentData;
  const uint PrePadding_View_5428;
  const uint BindlessResource_View_VTFeedbackBuffer;
  const uint PrePadding_View_5436;
  const uint BindlessResource_View_PhysicsFieldClipmapBuffer;
  const uint PrePadding_View_5444;
  const uint PrePadding_View_5448;
  const uint PrePadding_View_5452;
  const float3 View_TLASRelativePreViewTranslation;
  const float PrePadding_View_5468;
  const float3 View_TLASViewTilePosition;
}
#line 533 "/Engine/Generated/UniformBuffers/View.ush"
Texture2D<vector<float, 4> > View_DistantSkyLightLutTexture;
#line 534 "/Engine/Generated/UniformBuffers/View.ush"
SamplerState View_DistantSkyLightLutTextureSampler;
#line 535 "/Engine/Generated/UniformBuffers/View.ush"
Texture3D<vector<float, 4> > View_CameraAerialPerspectiveVolume;
#line 536 "/Engine/Generated/UniformBuffers/View.ush"
SamplerState View_CameraAerialPerspectiveVolumeSampler;
#line 3 "/Engine/Generated/UniformBuffers/Strata.ush"
cbuffer Strata {
  const uint Strata_MaxBytesPerPixel;
  const uint Strata_bRoughDiffuse;
  const uint Strata_PeelLayersAboveDepth;
  const uint Strata_bRoughnessTracking;
  const int Strata_SliceStoringDebugStrataTreeData;
  const int Strata_FirstSliceStoringStrataSSSData;
  const uint Strata_TileSize;
  const uint Strata_TileSizeLog2;
  const int2 Strata_TileCount;
  const int2 Strata_TileOffset;
  const int2 Strata_OverflowTileCount;
  const int2 Strata_OverflowTileOffset;
  const uint BindlessResource_Strata_MaterialTextureArray;
  const uint PrePadding_Strata_68;
  const uint BindlessResource_Strata_TopLayerTexture;
  const uint PrePadding_Strata_76;
  const uint BindlessResource_Strata_OpaqueRoughRefractionTexture;
  const uint PrePadding_Strata_84;
  const uint BindlessResource_Strata_BSDFOffsetTexture;
  const uint PrePadding_Strata_92;
  const uint BindlessResource_Strata_BSDFTileTexture;
  const uint PrePadding_Strata_100;
  const uint BindlessResource_Strata_BSDFTileCountBuffer;
}
#line 3 "/Engine/Generated/UniformBuffers/DrawRectangleParameters.ush"
cbuffer DrawRectangleParameters {
  const float4 DrawRectangleParameters_PosScaleBias;
  const float4 DrawRectangleParameters_UVScaleBias;
  const float4 DrawRectangleParameters_InvTargetSizeAndTextureSize;
}
#line 3 "/Engine/Generated/UniformBuffers/InstancedView.ush"
cbuffer InstancedView {
  const float4x4 InstancedView_TranslatedWorldToClip[2];
  const float4x4 InstancedView_RelativeWorldToClip[2];
  const float4x4 InstancedView_ClipToRelativeWorld[2];
  const float4x4 InstancedView_TranslatedWorldToView[2];
  const float4x4 InstancedView_ViewToTranslatedWorld[2];
  const float4x4 InstancedView_TranslatedWorldToCameraView[2];
  const float4x4 InstancedView_CameraViewToTranslatedWorld[2];
  const float4x4 InstancedView_ViewToClip[2];
  const float4x4 InstancedView_ViewToClipNoAA[2];
  const float4x4 InstancedView_ClipToView[2];
  const float4x4 InstancedView_ClipToTranslatedWorld[2];
  const float4x4 InstancedView_SVPositionToTranslatedWorld[2];
  const float4x4 InstancedView_ScreenToRelativeWorld[2];
  const float4x4 InstancedView_ScreenToTranslatedWorld[2];
  const float4x4 InstancedView_MobileMultiviewShadowTransform[2];
  const float3 InstancedView_ViewTilePosition;
  const float PrePadding_InstancedView_1932;
  const float3 InstancedView_MatrixTilePosition;
  const float PrePadding_InstancedView_1948;
  const float3 InstancedView_ViewForward;
  const float PrePadding_InstancedView_1964;
  const float3 InstancedView_ViewUp;
  const float PrePadding_InstancedView_1980;
  const float3 InstancedView_ViewRight;
  const float PrePadding_InstancedView_1996;
  const float4 InstancedView_HMDViewNoRollUp[2];
  const float4 InstancedView_HMDViewNoRollRight[2];
  const float4 InstancedView_InvDeviceZToWorldZTransform[2];
  const float4 InstancedView_ScreenPositionScaleBias[2];
  const float4 InstancedView_RelativeWorldCameraOrigin[2];
  const float4 InstancedView_TranslatedWorldCameraOrigin[2];
  const float4 InstancedView_RelativeWorldViewOrigin[2];
  const float4 InstancedView_RelativePreViewTranslation[2];
  const float4x4 InstancedView_PrevViewToClip[2];
  const float4x4 InstancedView_PrevClipToView[2];
  const float4x4 InstancedView_PrevTranslatedWorldToClip[2];
  const float4x4 InstancedView_PrevTranslatedWorldToView[2];
  const float4x4 InstancedView_PrevViewToTranslatedWorld[2];
  const float4x4 InstancedView_PrevTranslatedWorldToCameraView[2];
  const float4x4 InstancedView_PrevCameraViewToTranslatedWorld[2];
  const float4 InstancedView_PrevTranslatedWorldCameraOrigin[2];
  const float4 InstancedView_PrevRelativeWorldCameraOrigin[2];
  const float4 InstancedView_PrevRelativeWorldViewOrigin[2];
  const float4 InstancedView_RelativePrevPreViewTranslation[2];
  const float4x4 InstancedView_PrevClipToRelativeWorld[2];
  const float4x4 InstancedView_PrevScreenToTranslatedWorld[2];
  const float4x4 InstancedView_ClipToPrevClip[2];
  const float4x4 InstancedView_ClipToPrevClipWithAA[2];
  const float4 InstancedView_TemporalAAJitter[2];
  const float4 InstancedView_GlobalClippingPlane[2];
  const float4 InstancedView_FieldOfViewWideAngles[2];
  const float4 InstancedView_PrevFieldOfViewWideAngles[2];
  const float4 InstancedView_ViewRectMin[2];
  const float4 InstancedView_ViewSizeAndInvSize;
  const uint4 InstancedView_ViewRectMinAndSize;
  const float4 InstancedView_LightProbeSizeRatioAndInvSizeRatio;
  const float4 InstancedView_BufferSizeAndInvSize;
  const float4 InstancedView_BufferBilinearUVMinMax[2];
  const float4 InstancedView_ScreenToViewSpace[2];
  const float4 InstancedView_BufferToSceneTextureScale[2];
  const float2 InstancedView_ResolutionFractionAndInv;
  const int InstancedView_NumSceneColorMSAASamples;
  const int PrePadding_InstancedView_4124;
  const float4 InstancedView_ProjectionDepthThicknessScale[2];
  const float InstancedView_PreExposure;
  const float InstancedView_OneOverPreExposure;
  const float PrePadding_InstancedView_4168;
  const float PrePadding_InstancedView_4172;
  const float4 InstancedView_DiffuseOverrideParameter;
  const float4 InstancedView_SpecularOverrideParameter;
  const float4 InstancedView_NormalOverrideParameter;
  const float2 InstancedView_RoughnessOverrideParameter;
  const float InstancedView_PrevFrameGameTime;
  const float InstancedView_PrevFrameRealTime;
  const float InstancedView_OutOfBoundsMask;
  const float PrePadding_InstancedView_4244;
  const float PrePadding_InstancedView_4248;
  const float PrePadding_InstancedView_4252;
  const float4 InstancedView_WorldCameraMovementSinceLastFrame[2];
  const float InstancedView_CullingSign;
  const float PrePadding_InstancedView_4292;
  const float PrePadding_InstancedView_4296;
  const float PrePadding_InstancedView_4300;
  const float4 InstancedView_NearPlane[2];
  const float InstancedView_GameTime;
  const float InstancedView_RealTime;
  const float InstancedView_DeltaTime;
  const float InstancedView_MaterialTextureMipBias;
  const float InstancedView_MaterialTextureDerivativeMultiply;
  const uint InstancedView_Random;
  const uint InstancedView_FrameNumber;
  const uint InstancedView_FrameCounter;
  const uint InstancedView_StateFrameIndexMod8;
  const uint InstancedView_StateFrameIndex;
  const uint InstancedView_DebugViewModeMask;
  const uint InstancedView_WorldIsPaused;
  const float InstancedView_CameraCut;
  const float InstancedView_UnlitViewmodeMask;
  const float PrePadding_InstancedView_4392;
  const float PrePadding_InstancedView_4396;
  const float4 InstancedView_DirectionalLightColor;
  const float3 InstancedView_DirectionalLightDirection;
  const float PrePadding_InstancedView_4428;
  const float4 InstancedView_TranslucencyLightingVolumeMin[2];
  const float4 InstancedView_TranslucencyLightingVolumeInvSize[2];
  const float4 InstancedView_TemporalAAParams;
  const float4 InstancedView_CircleDOFParams;
  const float InstancedView_DepthOfFieldSensorWidth;
  const float InstancedView_DepthOfFieldFocalDistance;
  const float InstancedView_DepthOfFieldScale;
  const float InstancedView_DepthOfFieldFocalLength;
  const float InstancedView_DepthOfFieldFocalRegion;
  const float InstancedView_DepthOfFieldNearTransitionRegion;
  const float InstancedView_DepthOfFieldFarTransitionRegion;
  const float InstancedView_MotionBlurNormalizedToPixel;
  const float InstancedView_GeneralPurposeTweak;
  const float InstancedView_GeneralPurposeTweak2;
  const float InstancedView_DemosaicVposOffset;
  const float InstancedView_DecalDepthBias;
  const float3 InstancedView_IndirectLightingColorScale;
  const float PrePadding_InstancedView_4588;
  const float3 InstancedView_PrecomputedIndirectLightingColorScale;
  const float PrePadding_InstancedView_4604;
  const float3 InstancedView_PrecomputedIndirectSpecularColorScale;
  const float PrePadding_InstancedView_4620;
  const float4 InstancedView_AtmosphereLightDirection[2];
  const float4 InstancedView_AtmosphereLightIlluminanceOnGroundPostTransmittance[2];
  const float4 InstancedView_AtmosphereLightIlluminanceOuterSpace[2];
  const float4 InstancedView_AtmosphereLightDiscLuminance[2];
  const float4 InstancedView_AtmosphereLightDiscCosHalfApexAngle_PPTrans[2];
  const float4 InstancedView_SkyViewLutSizeAndInvSize;
  const float3 InstancedView_SkyCameraTranslatedWorldOrigin;
  const float PrePadding_InstancedView_4812;
  const float4 InstancedView_SkyPlanetTranslatedWorldCenterAndViewHeight;
  const float4x4 InstancedView_SkyViewLutReferential;
  const float4 InstancedView_SkyAtmosphereSkyLuminanceFactor;
  const float InstancedView_SkyAtmospherePresentInScene;
  const float InstancedView_SkyAtmosphereHeightFogContribution;
  const float InstancedView_SkyAtmosphereBottomRadiusKm;
  const float InstancedView_SkyAtmosphereTopRadiusKm;
  const float4 InstancedView_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
  const float InstancedView_SkyAtmosphereAerialPerspectiveStartDepthKm;
  const float InstancedView_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
  const float InstancedView_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
  const float InstancedView_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm;
  const float InstancedView_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
  const float InstancedView_SkyAtmosphereApplyCameraAerialPerspectiveVolume;
  const float PrePadding_InstancedView_4968;
  const float PrePadding_InstancedView_4972;
  const float3 InstancedView_NormalCurvatureToRoughnessScaleBias;
  const float InstancedView_RenderingReflectionCaptureMask;
  const float InstancedView_RealTimeReflectionCapture;
  const float InstancedView_RealTimeReflectionCapturePreExposure;
  const float PrePadding_InstancedView_5000;
  const float PrePadding_InstancedView_5004;
  const float4 InstancedView_AmbientCubemapTint;
  const float InstancedView_AmbientCubemapIntensity;
  const float InstancedView_SkyLightApplyPrecomputedBentNormalShadowingFlag;
  const float InstancedView_SkyLightAffectReflectionFlag;
  const float InstancedView_SkyLightAffectGlobalIlluminationFlag;
  const float4 InstancedView_SkyLightColor;
  const float4 InstancedView_MobileSkyIrradianceEnvironmentMap[8];
  const float InstancedView_MobilePreviewMode;
  const float PrePadding_InstancedView_5188;
  const float PrePadding_InstancedView_5192;
  const float PrePadding_InstancedView_5196;
  const float4 InstancedView_HMDEyePaddingOffset[2];
  const float InstancedView_ReflectionCubemapMaxMip;
  const float InstancedView_ShowDecalsMask;
  const uint InstancedView_DistanceFieldAOSpecularOcclusionMode;
  const float InstancedView_IndirectCapsuleSelfShadowingIntensity;
  const float3 InstancedView_ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
  const float PrePadding_InstancedView_5260;
  const int4 InstancedView_StereoPassIndex[2];
  const float4 InstancedView_GlobalVolumeTranslatedCenterAndExtent[6];
  const float4 InstancedView_GlobalVolumeTranslatedWorldToUVAddAndMul[6];
  const float4 InstancedView_GlobalDistanceFieldMipTranslatedWorldToUVScale[6];
  const float4 InstancedView_GlobalDistanceFieldMipTranslatedWorldToUVBias[6];
  const float InstancedView_GlobalDistanceFieldMipFactor;
  const float InstancedView_GlobalDistanceFieldMipTransition;
  const int InstancedView_GlobalDistanceFieldClipmapSizeInPages;
  const int PrePadding_InstancedView_5692;
  const float3 InstancedView_GlobalDistanceFieldInvPageAtlasSize;
  const float PrePadding_InstancedView_5708;
  const float3 InstancedView_GlobalDistanceFieldInvCoverageAtlasSize;
  const float InstancedView_GlobalVolumeDimension;
  const float InstancedView_GlobalVolumeTexelSize;
  const float InstancedView_MaxGlobalDFAOConeDistance;
  const uint InstancedView_NumGlobalSDFClipmaps;
  const float InstancedView_CoveredExpandSurfaceScale;
  const float InstancedView_NotCoveredExpandSurfaceScale;
  const float InstancedView_NotCoveredMinStepScale;
  const float InstancedView_DitheredTransparencyStepThreshold;
  const float InstancedView_DitheredTransparencyTraceThreshold;
  const int2 InstancedView_CursorPosition;
  const float InstancedView_bCheckerboardSubsurfaceProfileRendering;
  const float PrePadding_InstancedView_5772;
  const float3 InstancedView_VolumetricFogInvGridSize;
  const float PrePadding_InstancedView_5788;
  const float3 InstancedView_VolumetricFogGridZParams;
  const float PrePadding_InstancedView_5804;
  const float2 InstancedView_VolumetricFogSVPosToVolumeUV;
  const float2 InstancedView_VolumetricFogViewGridUVToPrevViewRectUV;
  const float2 InstancedView_VolumetricFogPrevViewGridRectUVToResourceUV;
  const float2 InstancedView_VolumetricFogPrevUVMax;
  const float2 InstancedView_VolumetricFogScreenToResourceUV;
  const float2 InstancedView_VolumetricFogUVMax;
  const float InstancedView_VolumetricFogMaxDistance;
  const float PrePadding_InstancedView_5860;
  const float PrePadding_InstancedView_5864;
  const float PrePadding_InstancedView_5868;
  const float3 InstancedView_VolumetricLightmapWorldToUVScale;
  const float PrePadding_InstancedView_5884;
  const float3 InstancedView_VolumetricLightmapWorldToUVAdd;
  const float PrePadding_InstancedView_5900;
  const float3 InstancedView_VolumetricLightmapIndirectionTextureSize;
  const float InstancedView_VolumetricLightmapBrickSize;
  const float3 InstancedView_VolumetricLightmapBrickTexelSize;
  const float InstancedView_IndirectLightingCacheShowFlag;
  const float InstancedView_EyeToPixelSpreadAngle;
  const float PrePadding_InstancedView_5940;
  const float PrePadding_InstancedView_5944;
  const float PrePadding_InstancedView_5948;
  const float4 InstancedView_XRPassthroughCameraUVs[2];
  const float InstancedView_GlobalVirtualTextureMipBias;
  const uint InstancedView_VirtualTextureFeedbackShift;
  const uint InstancedView_VirtualTextureFeedbackMask;
  const uint InstancedView_VirtualTextureFeedbackStride;
  const uint InstancedView_VirtualTextureFeedbackJitterOffset;
  const uint InstancedView_VirtualTextureFeedbackSampleOffset;
  const uint PrePadding_InstancedView_6008;
  const uint PrePadding_InstancedView_6012;
  const float4 InstancedView_RuntimeVirtualTextureMipLevel;
  const float2 InstancedView_RuntimeVirtualTexturePackHeight;
  const float PrePadding_InstancedView_6040;
  const float PrePadding_InstancedView_6044;
  const float4 InstancedView_RuntimeVirtualTextureDebugParams;
  const float InstancedView_OverrideLandscapeLOD;
  const int InstancedView_FarShadowStaticMeshLODBias;
  const float InstancedView_MinRoughness;
  const float PrePadding_InstancedView_6076;
  const float4 InstancedView_HairRenderInfo;
  const uint InstancedView_EnableSkyLight;
  const uint InstancedView_HairRenderInfoBits;
  const uint InstancedView_HairComponents;
  const float InstancedView_bSubsurfacePostprocessEnabled;
  const float4 InstancedView_SSProfilesTextureSizeAndInvSize;
  const float4 InstancedView_SSProfilesPreIntegratedTextureSizeAndInvSize;
  const float4 InstancedView_SpecularProfileTextureSizeAndInvSize;
  const float3 InstancedView_PhysicsFieldClipmapCenter;
  const float InstancedView_PhysicsFieldClipmapDistance;
  const int InstancedView_PhysicsFieldClipmapResolution;
  const int InstancedView_PhysicsFieldClipmapExponent;
  const int InstancedView_PhysicsFieldClipmapCount;
  const int InstancedView_PhysicsFieldTargetCount;
  const int4 InstancedView_PhysicsFieldTargets[32];
  const uint4 InstancedView_GPUSceneViewId[2];
  const float InstancedView_ViewResolutionFraction;
  const float InstancedView_SubSurfaceColorAsTransmittanceAtDistanceInMeters;
  const float PrePadding_InstancedView_6744;
  const float PrePadding_InstancedView_6748;
  const float4 InstancedView_TanAndInvTanHalfFOV[2];
  const float4 InstancedView_PrevTanAndInvTanHalfFOV[2];
  const float4 InstancedView_GlintLUTParameters0[2];
  const float4 InstancedView_GlintLUTParameters1[2];
}
#line 3 "/Engine/Generated/UniformBuffers/MobileReflectionCapture.ush"
cbuffer MobileReflectionCapture {
  const float4 MobileReflectionCapture_Params;
  const uint BindlessResource_MobileReflectionCapture_Texture;
  const uint PrePadding_MobileReflectionCapture_20;
  const uint BindlessSampler_MobileReflectionCapture_TextureSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/InstanceVF.ush"
cbuffer InstanceVF {
  const uint BindlessResource_InstanceVF_VertexFetch_InstanceOriginBuffer;
  const uint PrePadding_InstanceVF_4;
  const uint BindlessResource_InstanceVF_VertexFetch_InstanceTransformBuffer;
  const uint PrePadding_InstanceVF_12;
  const uint BindlessResource_InstanceVF_VertexFetch_InstanceLightmapBuffer;
  const uint PrePadding_InstanceVF_20;
  const uint BindlessResource_InstanceVF_InstanceCustomDataBuffer;
  const uint PrePadding_InstanceVF_28;
  const int InstanceVF_NumCustomDataFloats;
}
#line 3 "/Engine/Generated/UniformBuffers/SingleLayerWater.ush"
cbuffer SingleLayerWater {
  const uint BindlessResource_SingleLayerWater_SceneColorWithoutSingleLayerWaterTexture;
  const uint PrePadding_SingleLayerWater_4;
  const uint BindlessSampler_SingleLayerWater_SceneColorWithoutSingleLayerWaterSampler;
  const uint PrePadding_SingleLayerWater_12;
  const uint BindlessResource_SingleLayerWater_SceneDepthWithoutSingleLayerWaterTexture;
  const uint PrePadding_SingleLayerWater_20;
  const uint BindlessSampler_SingleLayerWater_SceneDepthWithoutSingleLayerWaterSampler;
  const uint PrePadding_SingleLayerWater_28;
  const uint BindlessResource_SingleLayerWater_CustomDepthTexture;
  const uint PrePadding_SingleLayerWater_36;
  const uint BindlessResource_SingleLayerWater_CustomStencilTexture;
  const uint PrePadding_SingleLayerWater_44;
  const uint BindlessSampler_SingleLayerWater_CustomDepthSampler;
  const uint PrePadding_SingleLayerWater_52;
  const uint PrePadding_SingleLayerWater_56;
  const uint PrePadding_SingleLayerWater_60;
  const float4 SingleLayerWater_SceneWithoutSingleLayerWaterMinMaxUV;
  const float4 SingleLayerWater_DistortionParams;
  const float2 SingleLayerWater_SceneWithoutSingleLayerWaterTextureSize;
  const float2 SingleLayerWater_SceneWithoutSingleLayerWaterInvTextureSize;
  const uint SingleLayerWater_bMainDirectionalLightVSMFiltering;
  const uint SingleLayerWater_bSeparateMainDirLightLuminance;
  const float PrePadding_SingleLayerWater_ForwardDirLightCloudShadow_120;
  const float PrePadding_SingleLayerWater_ForwardDirLightCloudShadow_124;
  const float4x4 SingleLayerWater_ForwardDirLightCloudShadow_CloudShadowmapTranslatedWorldToLightClipMatrix;
  const float SingleLayerWater_ForwardDirLightCloudShadow_CloudShadowmapFarDepthKm;
  const float PrePadding_SingleLayerWater_ForwardDirLightCloudShadow_196;
  const uint BindlessResource_SingleLayerWater_ForwardDirLightCloudShadow_CloudShadowmapTexture;
  const uint PrePadding_SingleLayerWater_ForwardDirLightCloudShadow_204;
  const uint BindlessSampler_SingleLayerWater_ForwardDirLightCloudShadow_CloudShadowmapSampler;
  const uint PrePadding_SingleLayerWater_ForwardDirLightCloudShadow_212;
  const float SingleLayerWater_ForwardDirLightCloudShadow_CloudShadowmapStrength;
  const float PrePadding_SingleLayerWater_BlueNoise_220;
  const int3 SingleLayerWater_BlueNoise_Dimensions;
  const int PrePadding_SingleLayerWater_BlueNoise_236;
  const int3 SingleLayerWater_BlueNoise_ModuloMasks;
  const int PrePadding_SingleLayerWater_BlueNoise_252;
  const uint BindlessResource_SingleLayerWater_BlueNoise_ScalarTexture;
  const uint PrePadding_SingleLayerWater_BlueNoise_260;
  const uint BindlessResource_SingleLayerWater_BlueNoise_Vec2Texture;
}
#line 3 "/Engine/Generated/UniformBuffers/PrimitiveDither.ush"
cbuffer PrimitiveDither {
  const float PrimitiveDither_LODFactor;
}
#line 3 "/Engine/Generated/UniformBuffers/PrimitiveFade.ush"
cbuffer PrimitiveFade {
  const float2 PrimitiveFade_FadeTimeScaleBias;
}
#line 3 "/Engine/Generated/UniformBuffers/DeferredDecal.ush"
cbuffer DeferredDecal {
  const uint BindlessResource_DeferredDecal_PreviousFrameNormal;
  const uint PrePadding_DeferredDecal_4;
  const int DeferredDecal_NormalReprojectionEnabled;
  const float DeferredDecal_NormalReprojectionThresholdLow;
  const float DeferredDecal_NormalReprojectionThresholdHigh;
  const float DeferredDecal_NormalReprojectionThresholdScaleHelper;
  const float2 DeferredDecal_NormalReprojectionJitter;
}
#line 3 "/Engine/Generated/UniformBuffers/SceneTexturesStruct.ush"
cbuffer SceneTexturesStruct {
  const uint BindlessResource_SceneTexturesStruct_SceneColorTexture;
  const uint PrePadding_SceneTexturesStruct_4;
  const uint BindlessResource_SceneTexturesStruct_SceneDepthTexture;
  const uint PrePadding_SceneTexturesStruct_12;
  const uint BindlessResource_SceneTexturesStruct_ScenePartialDepthTexture;
  const uint PrePadding_SceneTexturesStruct_20;
  const uint BindlessResource_SceneTexturesStruct_GBufferATexture;
  const uint PrePadding_SceneTexturesStruct_28;
  const uint BindlessResource_SceneTexturesStruct_GBufferBTexture;
  const uint PrePadding_SceneTexturesStruct_36;
  const uint BindlessResource_SceneTexturesStruct_GBufferCTexture;
  const uint PrePadding_SceneTexturesStruct_44;
  const uint BindlessResource_SceneTexturesStruct_GBufferDTexture;
  const uint PrePadding_SceneTexturesStruct_52;
  const uint BindlessResource_SceneTexturesStruct_GBufferETexture;
  const uint PrePadding_SceneTexturesStruct_60;
  const uint BindlessResource_SceneTexturesStruct_GBufferFTexture;
  const uint PrePadding_SceneTexturesStruct_68;
  const uint BindlessResource_SceneTexturesStruct_GBufferVelocityTexture;
  const uint PrePadding_SceneTexturesStruct_76;
  const uint BindlessResource_SceneTexturesStruct_ScreenSpaceAOTexture;
  const uint PrePadding_SceneTexturesStruct_84;
  const uint BindlessResource_SceneTexturesStruct_CustomDepthTexture;
  const uint PrePadding_SceneTexturesStruct_92;
  const uint BindlessResource_SceneTexturesStruct_CustomStencilTexture;
  const uint PrePadding_SceneTexturesStruct_100;
  const uint BindlessSampler_SceneTexturesStruct_PointClampSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/MobileSceneTextures.ush"
cbuffer MobileSceneTextures {
  const uint BindlessResource_MobileSceneTextures_SceneColorTexture;
  const uint PrePadding_MobileSceneTextures_4;
  const uint BindlessSampler_MobileSceneTextures_SceneColorTextureSampler;
  const uint PrePadding_MobileSceneTextures_12;
  const uint BindlessResource_MobileSceneTextures_SceneDepthTexture;
  const uint PrePadding_MobileSceneTextures_20;
  const uint BindlessSampler_MobileSceneTextures_SceneDepthTextureSampler;
  const uint PrePadding_MobileSceneTextures_28;
  const uint BindlessResource_MobileSceneTextures_ScenePartialDepthTexture;
  const uint PrePadding_MobileSceneTextures_36;
  const uint BindlessSampler_MobileSceneTextures_ScenePartialDepthTextureSampler;
  const uint PrePadding_MobileSceneTextures_44;
  const uint BindlessResource_MobileSceneTextures_CustomDepthTexture;
  const uint PrePadding_MobileSceneTextures_52;
  const uint BindlessSampler_MobileSceneTextures_CustomDepthTextureSampler;
  const uint PrePadding_MobileSceneTextures_60;
  const uint BindlessResource_MobileSceneTextures_CustomStencilTexture;
  const uint PrePadding_MobileSceneTextures_68;
  const uint BindlessResource_MobileSceneTextures_SceneVelocityTexture;
  const uint PrePadding_MobileSceneTextures_76;
  const uint BindlessSampler_MobileSceneTextures_SceneVelocityTextureSampler;
  const uint PrePadding_MobileSceneTextures_84;
  const uint BindlessResource_MobileSceneTextures_GBufferATexture;
  const uint PrePadding_MobileSceneTextures_92;
  const uint BindlessResource_MobileSceneTextures_GBufferBTexture;
  const uint PrePadding_MobileSceneTextures_100;
  const uint BindlessResource_MobileSceneTextures_GBufferCTexture;
  const uint PrePadding_MobileSceneTextures_108;
  const uint BindlessResource_MobileSceneTextures_GBufferDTexture;
  const uint PrePadding_MobileSceneTextures_116;
  const uint BindlessResource_MobileSceneTextures_SceneDepthAuxTexture;
  const uint PrePadding_MobileSceneTextures_124;
  const uint BindlessResource_MobileSceneTextures_LocalLightTextureA;
  const uint PrePadding_MobileSceneTextures_132;
  const uint BindlessResource_MobileSceneTextures_LocalLightTextureB;
  const uint PrePadding_MobileSceneTextures_140;
  const uint BindlessSampler_MobileSceneTextures_GBufferATextureSampler;
  const uint PrePadding_MobileSceneTextures_148;
  const uint BindlessSampler_MobileSceneTextures_GBufferBTextureSampler;
  const uint PrePadding_MobileSceneTextures_156;
  const uint BindlessSampler_MobileSceneTextures_GBufferCTextureSampler;
  const uint PrePadding_MobileSceneTextures_164;
  const uint BindlessSampler_MobileSceneTextures_GBufferDTextureSampler;
  const uint PrePadding_MobileSceneTextures_172;
  const uint BindlessSampler_MobileSceneTextures_SceneDepthAuxTextureSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/Primitive.ush"
cbuffer Primitive {
  const uint Primitive_Flags;
  const uint Primitive_InstanceSceneDataOffset;
  const uint Primitive_NumInstanceSceneDataEntries;
  const int Primitive_SingleCaptureIndex;
  const float3 Primitive_TilePosition;
  const uint Primitive_PrimitiveComponentId;
  const float4x4 Primitive_LocalToRelativeWorld;
  const float4x4 Primitive_RelativeWorldToLocal;
  const float4x4 Primitive_PreviousLocalToRelativeWorld;
  const float4x4 Primitive_PreviousRelativeWorldToLocal;
  const float4x4 Primitive_WorldToPreviousWorld;
  const float3 Primitive_InvNonUniformScale;
  const float Primitive_ObjectBoundsX;
  const float4 Primitive_ObjectRelativeWorldPositionAndRadius;
  const float3 Primitive_ActorRelativeWorldPosition;
  const uint Primitive_LightmapUVIndex;
  const float3 Primitive_ObjectOrientation;
  const uint Primitive_LightmapDataIndex;
  const float4 Primitive_NonUniformScale;
  const float3 Primitive_PreSkinnedLocalBoundsMin;
  const uint Primitive_NaniteResourceID;
  const float3 Primitive_PreSkinnedLocalBoundsMax;
  const uint Primitive_NaniteHierarchyOffset;
  const float3 Primitive_LocalObjectBoundsMin;
  const float Primitive_ObjectBoundsY;
  const float3 Primitive_LocalObjectBoundsMax;
  const float Primitive_ObjectBoundsZ;
  const float3 Primitive_InstanceLocalBoundsCenter;
  const uint Primitive_InstancePayloadDataOffset;
  const float3 Primitive_InstanceLocalBoundsExtent;
  const uint Primitive_InstancePayloadDataStride;
  const uint Primitive_InstancePayloadExtensionSize;
  const uint PrePadding_Primitive_532;
  const uint PrePadding_Primitive_536;
  const uint PrePadding_Primitive_540;
  const float3 Primitive_WireframeColor;
  const uint Primitive_PackedNaniteFlags;
  const float3 Primitive_LevelColor;
  const int Primitive_PersistentPrimitiveIndex;
  const float2 Primitive_InstanceDrawDistanceMinMaxSquared;
  const float Primitive_InstanceWPODisableDistanceSquared;
  const uint Primitive_NaniteRayTracingDataOffset;
  const float Primitive_MaxWPOExtent;
  const float Primitive_MinMaterialDisplacement;
  const float Primitive_MaxMaterialDisplacement;
  const uint Primitive_CustomStencilValueAndMask;
  const uint Primitive_VisibilityFlags;
  const uint PrePadding_Primitive_612;
  const uint PrePadding_Primitive_616;
  const uint PrePadding_Primitive_620;
  const float4 Primitive_CustomPrimitiveData[9];
}
#line 3 "/Engine/Generated/UniformBuffers/Scene.ush"
cbuffer Scene {
  const uint BindlessResource_Scene_GPUScene_GPUSceneInstanceSceneData;
  const uint PrePadding_Scene_GPUScene_4;
  const uint BindlessResource_Scene_GPUScene_GPUSceneInstancePayloadData;
  const uint PrePadding_Scene_GPUScene_12;
  const uint BindlessResource_Scene_GPUScene_GPUScenePrimitiveSceneData;
  const uint PrePadding_Scene_GPUScene_20;
  const uint BindlessResource_Scene_GPUScene_GPUSceneLightmapData;
  const uint PrePadding_Scene_GPUScene_28;
  const uint BindlessResource_Scene_GPUScene_GPUSceneLightData;
  const uint PrePadding_Scene_GPUScene_36;
  const uint Scene_GPUScene_InstanceDataSOAStride;
  const uint Scene_GPUScene_GPUSceneFrameNumber;
  const int Scene_GPUScene_NumInstances;
  const int Scene_GPUScene_NumScenePrimitives;
}
#line 3 "/Engine/Generated/UniformBuffers/InstanceCulling.ush"
cbuffer InstanceCulling {
  const uint BindlessResource_InstanceCulling_InstanceIdsBuffer;
  const uint PrePadding_InstanceCulling_4;
  const uint BindlessResource_InstanceCulling_PageInfoBuffer;
  const uint PrePadding_InstanceCulling_12;
  const uint InstanceCulling_BufferCapacity;
}
#line 3 "/Engine/Generated/UniformBuffers/SpeedTreeData.ush"
cbuffer SpeedTreeData {
  const float4 SpeedTreeData_WindVector;
  const float4 SpeedTreeData_WindGlobal;
  const float4 SpeedTreeData_WindBranch;
  const float4 SpeedTreeData_WindBranchTwitch;
  const float4 SpeedTreeData_WindBranchWhip;
  const float4 SpeedTreeData_WindBranchAnchor;
  const float4 SpeedTreeData_WindBranchAdherences;
  const float4 SpeedTreeData_WindTurbulences;
  const float4 SpeedTreeData_WindLeaf1Ripple;
  const float4 SpeedTreeData_WindLeaf1Tumble;
  const float4 SpeedTreeData_WindLeaf1Twitch;
  const float4 SpeedTreeData_WindLeaf2Ripple;
  const float4 SpeedTreeData_WindLeaf2Tumble;
  const float4 SpeedTreeData_WindLeaf2Twitch;
  const float4 SpeedTreeData_WindFrondRipple;
  const float4 SpeedTreeData_WindRollingBranch;
  const float4 SpeedTreeData_WindRollingLeafAndDirection;
  const float4 SpeedTreeData_WindRollingNoise;
  const float4 SpeedTreeData_WindAnimation;
  const float4 SpeedTreeData_PrevWindVector;
  const float4 SpeedTreeData_PrevWindGlobal;
  const float4 SpeedTreeData_PrevWindBranch;
  const float4 SpeedTreeData_PrevWindBranchTwitch;
  const float4 SpeedTreeData_PrevWindBranchWhip;
  const float4 SpeedTreeData_PrevWindBranchAnchor;
  const float4 SpeedTreeData_PrevWindBranchAdherences;
  const float4 SpeedTreeData_PrevWindTurbulences;
  const float4 SpeedTreeData_PrevWindLeaf1Ripple;
  const float4 SpeedTreeData_PrevWindLeaf1Tumble;
  const float4 SpeedTreeData_PrevWindLeaf1Twitch;
  const float4 SpeedTreeData_PrevWindLeaf2Ripple;
  const float4 SpeedTreeData_PrevWindLeaf2Tumble;
  const float4 SpeedTreeData_PrevWindLeaf2Twitch;
  const float4 SpeedTreeData_PrevWindFrondRipple;
  const float4 SpeedTreeData_PrevWindRollingBranch;
  const float4 SpeedTreeData_PrevWindRollingLeafAndDirection;
  const float4 SpeedTreeData_PrevWindRollingNoise;
  const float4 SpeedTreeData_PrevWindAnimation;
}
#line 3 "/Engine/Generated/UniformBuffers/Atmosphere.ush"
cbuffer Atmosphere {
  const float Atmosphere_MultiScatteringFactor;
  const float Atmosphere_BottomRadiusKm;
  const float Atmosphere_TopRadiusKm;
  const float Atmosphere_RayleighDensityExpScale;
  const float4 Atmosphere_RayleighScattering;
  const float4 Atmosphere_MieScattering;
  const float Atmosphere_MieDensityExpScale;
  const float PrePadding_Atmosphere_52;
  const float PrePadding_Atmosphere_56;
  const float PrePadding_Atmosphere_60;
  const float4 Atmosphere_MieExtinction;
  const float Atmosphere_MiePhaseG;
  const float PrePadding_Atmosphere_84;
  const float PrePadding_Atmosphere_88;
  const float PrePadding_Atmosphere_92;
  const float4 Atmosphere_MieAbsorption;
  const float Atmosphere_AbsorptionDensity0LayerWidth;
  const float Atmosphere_AbsorptionDensity0ConstantTerm;
  const float Atmosphere_AbsorptionDensity0LinearTerm;
  const float Atmosphere_AbsorptionDensity1ConstantTerm;
  const float Atmosphere_AbsorptionDensity1LinearTerm;
  const float PrePadding_Atmosphere_132;
  const float PrePadding_Atmosphere_136;
  const float PrePadding_Atmosphere_140;
  const float4 Atmosphere_AbsorptionExtinction;
  const float4 Atmosphere_GroundAlbedo;
}
#line 3 "/Engine/Generated/UniformBuffers/BlueNoise.ush"
cbuffer BlueNoise {
  const int3 BlueNoise_Dimensions;
  const int PrePadding_BlueNoise_12;
  const int3 BlueNoise_ModuloMasks;
  const int PrePadding_BlueNoise_28;
  const uint BindlessResource_BlueNoise_ScalarTexture;
  const uint PrePadding_BlueNoise_36;
  const uint BindlessResource_BlueNoise_Vec2Texture;
}
#line 3 "/Engine/Generated/UniformBuffers/OpaqueBasePass.ush"
cbuffer OpaqueBasePass {
  const uint OpaqueBasePass_Shared_Forward_NumLocalLights;
  const uint OpaqueBasePass_Shared_Forward_NumReflectionCaptures;
  const uint OpaqueBasePass_Shared_Forward_HasDirectionalLight;
  const uint OpaqueBasePass_Shared_Forward_NumGridCells;
  const int3 OpaqueBasePass_Shared_Forward_CulledGridSize;
  const uint OpaqueBasePass_Shared_Forward_MaxCulledLightsPerCell;
  const uint OpaqueBasePass_Shared_Forward_LightGridPixelSizeShift;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_36;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_40;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_44;
  const float3 OpaqueBasePass_Shared_Forward_LightGridZParams;
  const float PrePadding_OpaqueBasePass_Shared_Forward_60;
  const float3 OpaqueBasePass_Shared_Forward_DirectionalLightDirection;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSourceRadius;
  const float3 OpaqueBasePass_Shared_Forward_DirectionalLightColor;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightVolumetricScatteringIntensity;
  const uint OpaqueBasePass_Shared_Forward_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_100;
  const float2 OpaqueBasePass_Shared_Forward_DirectionalLightDistanceFadeMAD;
  const uint OpaqueBasePass_Shared_Forward_NumDirectionalLightCascades;
  const int OpaqueBasePass_Shared_Forward_DirectionalLightVSM;
  const int PrePadding_OpaqueBasePass_Shared_Forward_120;
  const int PrePadding_OpaqueBasePass_Shared_Forward_124;
  const float4 OpaqueBasePass_Shared_Forward_CascadeEndDepths;
  const float4x4 OpaqueBasePass_Shared_Forward_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 OpaqueBasePass_Shared_Forward_DirectionalLightShadowmapMinMax[4];
  const float4 OpaqueBasePass_Shared_Forward_DirectionalLightShadowmapAtlasBufferSize;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightDepthBias;
  const uint OpaqueBasePass_Shared_Forward_DirectionalLightUseStaticShadowing;
  const uint OpaqueBasePass_Shared_Forward_SimpleLightsEndIndex;
  const uint OpaqueBasePass_Shared_Forward_ClusteredDeferredSupportedEndIndex;
  const uint OpaqueBasePass_Shared_Forward_LumenSupportedStartIndex;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_500;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_504;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_508;
  const float4 OpaqueBasePass_Shared_Forward_DirectionalLightStaticShadowBufferSize;
  const float4x4 OpaqueBasePass_Shared_Forward_DirectionalLightTranslatedWorldToStaticShadow;
  const uint OpaqueBasePass_Shared_Forward_DirectLightingShowFlag;
  const float PrePadding_OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_596;
  const float PrePadding_OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_600;
  const float PrePadding_OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_604;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_ScreenRayLength;
  const int OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTRayCount;
  const int OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint OpaqueBasePass_Shared_Forward_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_644;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_648;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_652;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_DirectionalLightShadowmapAtlas;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_660;
  const uint BindlessSampler_OpaqueBasePass_Shared_Forward_ShadowmapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_668;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_DirectionalLightStaticShadowmap;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_676;
  const uint BindlessSampler_OpaqueBasePass_Shared_Forward_StaticShadowmapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_684;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_ForwardLocalLightBuffer;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_692;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_NumCulledLightsGrid;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_700;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_CulledLightDataGrid32Bit;
  const uint PrePadding_OpaqueBasePass_Shared_Forward_708;
  const uint BindlessResource_OpaqueBasePass_Shared_Forward_CulledLightDataGrid16Bit;
  const float PrePadding_OpaqueBasePass_Shared_ForwardISR_716;
  const uint OpaqueBasePass_Shared_ForwardISR_NumLocalLights;
  const uint OpaqueBasePass_Shared_ForwardISR_NumReflectionCaptures;
  const uint OpaqueBasePass_Shared_ForwardISR_HasDirectionalLight;
  const uint OpaqueBasePass_Shared_ForwardISR_NumGridCells;
  const int3 OpaqueBasePass_Shared_ForwardISR_CulledGridSize;
  const uint OpaqueBasePass_Shared_ForwardISR_MaxCulledLightsPerCell;
  const uint OpaqueBasePass_Shared_ForwardISR_LightGridPixelSizeShift;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_756;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_760;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_764;
  const float3 OpaqueBasePass_Shared_ForwardISR_LightGridZParams;
  const float PrePadding_OpaqueBasePass_Shared_ForwardISR_780;
  const float3 OpaqueBasePass_Shared_ForwardISR_DirectionalLightDirection;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSourceRadius;
  const float3 OpaqueBasePass_Shared_ForwardISR_DirectionalLightColor;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightVolumetricScatteringIntensity;
  const uint OpaqueBasePass_Shared_ForwardISR_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_820;
  const float2 OpaqueBasePass_Shared_ForwardISR_DirectionalLightDistanceFadeMAD;
  const uint OpaqueBasePass_Shared_ForwardISR_NumDirectionalLightCascades;
  const int OpaqueBasePass_Shared_ForwardISR_DirectionalLightVSM;
  const int PrePadding_OpaqueBasePass_Shared_ForwardISR_840;
  const int PrePadding_OpaqueBasePass_Shared_ForwardISR_844;
  const float4 OpaqueBasePass_Shared_ForwardISR_CascadeEndDepths;
  const float4x4 OpaqueBasePass_Shared_ForwardISR_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 OpaqueBasePass_Shared_ForwardISR_DirectionalLightShadowmapMinMax[4];
  const float4 OpaqueBasePass_Shared_ForwardISR_DirectionalLightShadowmapAtlasBufferSize;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightDepthBias;
  const uint OpaqueBasePass_Shared_ForwardISR_DirectionalLightUseStaticShadowing;
  const uint OpaqueBasePass_Shared_ForwardISR_SimpleLightsEndIndex;
  const uint OpaqueBasePass_Shared_ForwardISR_ClusteredDeferredSupportedEndIndex;
  const uint OpaqueBasePass_Shared_ForwardISR_LumenSupportedStartIndex;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1220;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1224;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1228;
  const float4 OpaqueBasePass_Shared_ForwardISR_DirectionalLightStaticShadowBufferSize;
  const float4x4 OpaqueBasePass_Shared_ForwardISR_DirectionalLightTranslatedWorldToStaticShadow;
  const uint OpaqueBasePass_Shared_ForwardISR_DirectLightingShowFlag;
  const float PrePadding_OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1316;
  const float PrePadding_OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1320;
  const float PrePadding_OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_1324;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_ScreenRayLength;
  const int OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTRayCount;
  const int OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint OpaqueBasePass_Shared_ForwardISR_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1364;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1368;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1372;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_DirectionalLightShadowmapAtlas;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1380;
  const uint BindlessSampler_OpaqueBasePass_Shared_ForwardISR_ShadowmapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1388;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_DirectionalLightStaticShadowmap;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1396;
  const uint BindlessSampler_OpaqueBasePass_Shared_ForwardISR_StaticShadowmapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1404;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_ForwardLocalLightBuffer;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1412;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_NumCulledLightsGrid;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1420;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_CulledLightDataGrid32Bit;
  const uint PrePadding_OpaqueBasePass_Shared_ForwardISR_1428;
  const uint BindlessResource_OpaqueBasePass_Shared_ForwardISR_CulledLightDataGrid16Bit;
  const float PrePadding_OpaqueBasePass_Shared_Reflection_1436;
  const float4 OpaqueBasePass_Shared_Reflection_SkyLightParameters;
  const uint BindlessResource_OpaqueBasePass_Shared_Reflection_SkyLightCubemap;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1460;
  const uint BindlessSampler_OpaqueBasePass_Shared_Reflection_SkyLightCubemapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1468;
  const uint BindlessResource_OpaqueBasePass_Shared_Reflection_SkyLightBlendDestinationCubemap;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1476;
  const uint BindlessSampler_OpaqueBasePass_Shared_Reflection_SkyLightBlendDestinationCubemapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1484;
  const uint BindlessResource_OpaqueBasePass_Shared_Reflection_ReflectionCubemap;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1492;
  const uint BindlessSampler_OpaqueBasePass_Shared_Reflection_ReflectionCubemapSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1500;
  const uint BindlessResource_OpaqueBasePass_Shared_Reflection_PreIntegratedGF;
  const uint PrePadding_OpaqueBasePass_Shared_Reflection_1508;
  const uint BindlessSampler_OpaqueBasePass_Shared_Reflection_PreIntegratedGFSampler;
  const float PrePadding_OpaqueBasePass_Shared_PlanarReflection_1516;
  const float4 OpaqueBasePass_Shared_PlanarReflection_ReflectionPlane;
  const float4 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionOrigin;
  const float4 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionXAxis;
  const float4 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionYAxis;
  const float3x4 OpaqueBasePass_Shared_PlanarReflection_InverseTransposeMirrorMatrix;
  const float3 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionParameters;
  const float PrePadding_OpaqueBasePass_Shared_PlanarReflection_1644;
  const float2 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionParameters2;
  const float PrePadding_OpaqueBasePass_Shared_PlanarReflection_1656;
  const float PrePadding_OpaqueBasePass_Shared_PlanarReflection_1660;
  const float4x4 OpaqueBasePass_Shared_PlanarReflection_ProjectionWithExtraFOV[2];
  const float4 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionScreenScaleBias[2];
  const float2 OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionScreenBound;
  const uint OpaqueBasePass_Shared_PlanarReflection_bIsStereo;
  const uint PrePadding_OpaqueBasePass_Shared_PlanarReflection_1836;
  const uint BindlessResource_OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionTexture;
  const uint PrePadding_OpaqueBasePass_Shared_PlanarReflection_1844;
  const uint BindlessSampler_OpaqueBasePass_Shared_PlanarReflection_PlanarReflectionSampler;
  const float PrePadding_OpaqueBasePass_Shared_Fog_1852;
  const float4 OpaqueBasePass_Shared_Fog_ExponentialFogParameters;
  const float4 OpaqueBasePass_Shared_Fog_ExponentialFogParameters2;
  const float4 OpaqueBasePass_Shared_Fog_ExponentialFogColorParameter;
  const float4 OpaqueBasePass_Shared_Fog_ExponentialFogParameters3;
  const float4 OpaqueBasePass_Shared_Fog_SkyAtmosphereAmbientContributionColorScale;
  const float4 OpaqueBasePass_Shared_Fog_InscatteringLightDirection;
  const float4 OpaqueBasePass_Shared_Fog_DirectionalInscatteringColor;
  const float2 OpaqueBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_OpaqueBasePass_Shared_Fog_1976;
  const float PrePadding_OpaqueBasePass_Shared_Fog_1980;
  const float3 OpaqueBasePass_Shared_Fog_FogInscatteringTextureParameters;
  const float OpaqueBasePass_Shared_Fog_ApplyVolumetricFog;
  const float OpaqueBasePass_Shared_Fog_VolumetricFogStartDistance;
  const float OpaqueBasePass_Shared_Fog_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_OpaqueBasePass_Shared_Fog_FogInscatteringColorCubemap;
  const uint PrePadding_OpaqueBasePass_Shared_Fog_2012;
  const uint BindlessSampler_OpaqueBasePass_Shared_Fog_FogInscatteringColorSampler;
  const uint PrePadding_OpaqueBasePass_Shared_Fog_2020;
  const uint BindlessResource_OpaqueBasePass_Shared_Fog_IntegratedLightScattering;
  const uint PrePadding_OpaqueBasePass_Shared_Fog_2028;
  const uint BindlessSampler_OpaqueBasePass_Shared_Fog_IntegratedLightScatteringSampler;
  const float PrePadding_OpaqueBasePass_Shared_FogISR_2036;
  const float PrePadding_OpaqueBasePass_Shared_FogISR_2040;
  const float PrePadding_OpaqueBasePass_Shared_FogISR_2044;
  const float4 OpaqueBasePass_Shared_FogISR_ExponentialFogParameters;
  const float4 OpaqueBasePass_Shared_FogISR_ExponentialFogParameters2;
  const float4 OpaqueBasePass_Shared_FogISR_ExponentialFogColorParameter;
  const float4 OpaqueBasePass_Shared_FogISR_ExponentialFogParameters3;
  const float4 OpaqueBasePass_Shared_FogISR_SkyAtmosphereAmbientContributionColorScale;
  const float4 OpaqueBasePass_Shared_FogISR_InscatteringLightDirection;
  const float4 OpaqueBasePass_Shared_FogISR_DirectionalInscatteringColor;
  const float2 OpaqueBasePass_Shared_FogISR_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_OpaqueBasePass_Shared_FogISR_2168;
  const float PrePadding_OpaqueBasePass_Shared_FogISR_2172;
  const float3 OpaqueBasePass_Shared_FogISR_FogInscatteringTextureParameters;
  const float OpaqueBasePass_Shared_FogISR_ApplyVolumetricFog;
  const float OpaqueBasePass_Shared_FogISR_VolumetricFogStartDistance;
  const float OpaqueBasePass_Shared_FogISR_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_OpaqueBasePass_Shared_FogISR_FogInscatteringColorCubemap;
  const uint PrePadding_OpaqueBasePass_Shared_FogISR_2204;
  const uint BindlessSampler_OpaqueBasePass_Shared_FogISR_FogInscatteringColorSampler;
  const uint PrePadding_OpaqueBasePass_Shared_FogISR_2212;
  const uint BindlessResource_OpaqueBasePass_Shared_FogISR_IntegratedLightScattering;
  const uint PrePadding_OpaqueBasePass_Shared_FogISR_2220;
  const uint BindlessSampler_OpaqueBasePass_Shared_FogISR_IntegratedLightScatteringSampler;
  const float PrePadding_OpaqueBasePass_Shared_2228;
  const float PrePadding_OpaqueBasePass_Shared_2232;
  const float PrePadding_OpaqueBasePass_Shared_2236;
  const uint OpaqueBasePass_Shared_UseBasePassSkylight;
  const float PrePadding_OpaqueBasePass_Strata_2244;
  const float PrePadding_OpaqueBasePass_Strata_2248;
  const float PrePadding_OpaqueBasePass_Strata_2252;
  const uint OpaqueBasePass_Strata_MaxBytesPerPixel;
  const uint OpaqueBasePass_Strata_bRoughDiffuse;
  const uint OpaqueBasePass_Strata_PeelLayersAboveDepth;
  const uint OpaqueBasePass_Strata_bRoughnessTracking;
  const int OpaqueBasePass_Strata_SliceStoringDebugStrataTreeDataWithoutMRT;
  const int OpaqueBasePass_Strata_FirstSliceStoringStrataSSSDataWithoutMRT;
  const uint BindlessResource_OpaqueBasePass_Strata_MaterialTextureArrayUAVWithoutRTs;
  const uint PrePadding_OpaqueBasePass_Strata_2284;
  const uint BindlessResource_OpaqueBasePass_Strata_OpaqueRoughRefractionTextureUAV;
  const float PrePadding_OpaqueBasePass_2292;
  const float PrePadding_OpaqueBasePass_2296;
  const float PrePadding_OpaqueBasePass_2300;
  const int OpaqueBasePass_UseForwardScreenSpaceShadowMask;
  const int PrePadding_OpaqueBasePass_2308;
  const uint BindlessResource_OpaqueBasePass_ForwardScreenSpaceShadowMaskTexture;
  const uint PrePadding_OpaqueBasePass_2316;
  const uint BindlessResource_OpaqueBasePass_IndirectOcclusionTexture;
  const uint PrePadding_OpaqueBasePass_2324;
  const uint BindlessResource_OpaqueBasePass_ResolvedSceneDepthTexture;
  const float PrePadding_OpaqueBasePass_2332;
  const uint BindlessResource_OpaqueBasePass_DBufferATexture;
  const uint PrePadding_OpaqueBasePass_2340;
  const uint BindlessResource_OpaqueBasePass_DBufferBTexture;
  const uint PrePadding_OpaqueBasePass_2348;
  const uint BindlessResource_OpaqueBasePass_DBufferCTexture;
  const uint PrePadding_OpaqueBasePass_2356;
  const uint BindlessResource_OpaqueBasePass_DBufferRenderMask;
  const uint PrePadding_OpaqueBasePass_2364;
  const uint BindlessSampler_OpaqueBasePass_DBufferATextureSampler;
  const uint PrePadding_OpaqueBasePass_2372;
  const uint BindlessSampler_OpaqueBasePass_DBufferBTextureSampler;
  const uint PrePadding_OpaqueBasePass_2380;
  const uint BindlessSampler_OpaqueBasePass_DBufferCTextureSampler;
  const uint PrePadding_OpaqueBasePass_2388;
  const uint PrePadding_OpaqueBasePass_2392;
  const uint PrePadding_OpaqueBasePass_2396;
  const uint BindlessResource_OpaqueBasePass_PreIntegratedGFTexture;
  const uint PrePadding_OpaqueBasePass_2404;
  const uint BindlessSampler_OpaqueBasePass_PreIntegratedGFSampler;
  const uint PrePadding_OpaqueBasePass_2412;
  const int OpaqueBasePass_Is24BitUnormDepthStencil;
  const int PrePadding_OpaqueBasePass_2420;
  const uint BindlessResource_OpaqueBasePass_EyeAdaptationBuffer;
}
#line 3 "/Engine/Generated/UniformBuffers/FogStruct.ush"
cbuffer FogStruct {
  const float4 FogStruct_ExponentialFogParameters;
  const float4 FogStruct_ExponentialFogParameters2;
  const float4 FogStruct_ExponentialFogColorParameter;
  const float4 FogStruct_ExponentialFogParameters3;
  const float4 FogStruct_SkyAtmosphereAmbientContributionColorScale;
  const float4 FogStruct_InscatteringLightDirection;
  const float4 FogStruct_DirectionalInscatteringColor;
  const float2 FogStruct_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_FogStruct_120;
  const float PrePadding_FogStruct_124;
  const float3 FogStruct_FogInscatteringTextureParameters;
  const float FogStruct_ApplyVolumetricFog;
  const float FogStruct_VolumetricFogStartDistance;
  const float FogStruct_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_FogStruct_FogInscatteringColorCubemap;
  const uint PrePadding_FogStruct_156;
  const uint BindlessSampler_FogStruct_FogInscatteringColorSampler;
  const uint PrePadding_FogStruct_164;
  const uint BindlessResource_FogStruct_IntegratedLightScattering;
  const uint PrePadding_FogStruct_172;
  const uint BindlessSampler_FogStruct_IntegratedLightScatteringSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/ReflectionCaptureES31.ush"
cbuffer ReflectionCaptureES31 {
  const float4 ReflectionCaptureES31_PositionAndRadius[100];
  const float4 ReflectionCaptureES31_TilePosition[100];
  const float4 ReflectionCaptureES31_CaptureProperties[100];
  const float4 ReflectionCaptureES31_CaptureOffsetAndAverageBrightness[100];
  const float4x4 ReflectionCaptureES31_BoxTransform[100];
  const float4 ReflectionCaptureES31_BoxScales[100];
}
#line 3 "/Engine/Generated/UniformBuffers/ReflectionCaptureSM5.ush"
cbuffer ReflectionCaptureSM5 {
  const float4 ReflectionCaptureSM5_PositionAndRadius[341];
  const float4 ReflectionCaptureSM5_TilePosition[341];
  const float4 ReflectionCaptureSM5_CaptureProperties[341];
  const float4 ReflectionCaptureSM5_CaptureOffsetAndAverageBrightness[341];
  const float4x4 ReflectionCaptureSM5_BoxTransform[341];
  const float4 ReflectionCaptureSM5_BoxScales[341];
}
#line 3 "/Engine/Generated/UniformBuffers/ReflectionStruct.ush"
cbuffer ReflectionStruct {
  const float4 ReflectionStruct_SkyLightParameters;
  const uint BindlessResource_ReflectionStruct_SkyLightCubemap;
  const uint PrePadding_ReflectionStruct_20;
  const uint BindlessSampler_ReflectionStruct_SkyLightCubemapSampler;
  const uint PrePadding_ReflectionStruct_28;
  const uint BindlessResource_ReflectionStruct_SkyLightBlendDestinationCubemap;
  const uint PrePadding_ReflectionStruct_36;
  const uint BindlessSampler_ReflectionStruct_SkyLightBlendDestinationCubemapSampler;
  const uint PrePadding_ReflectionStruct_44;
  const uint BindlessResource_ReflectionStruct_ReflectionCubemap;
  const uint PrePadding_ReflectionStruct_52;
  const uint BindlessSampler_ReflectionStruct_ReflectionCubemapSampler;
  const uint PrePadding_ReflectionStruct_60;
  const uint BindlessResource_ReflectionStruct_PreIntegratedGF;
  const uint PrePadding_ReflectionStruct_68;
  const uint BindlessSampler_ReflectionStruct_PreIntegratedGFSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/ForwardLightData.ush"
cbuffer ForwardLightData {
  const uint ForwardLightData_NumLocalLights;
  const uint ForwardLightData_NumReflectionCaptures;
  const uint ForwardLightData_HasDirectionalLight;
  const uint ForwardLightData_NumGridCells;
  const int3 ForwardLightData_CulledGridSize;
  const uint ForwardLightData_MaxCulledLightsPerCell;
  const uint ForwardLightData_LightGridPixelSizeShift;
  const uint PrePadding_ForwardLightData_36;
  const uint PrePadding_ForwardLightData_40;
  const uint PrePadding_ForwardLightData_44;
  const float3 ForwardLightData_LightGridZParams;
  const float PrePadding_ForwardLightData_60;
  const float3 ForwardLightData_DirectionalLightDirection;
  const float ForwardLightData_DirectionalLightSourceRadius;
  const float3 ForwardLightData_DirectionalLightColor;
  const float ForwardLightData_DirectionalLightVolumetricScatteringIntensity;
  const uint ForwardLightData_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_ForwardLightData_100;
  const float2 ForwardLightData_DirectionalLightDistanceFadeMAD;
  const uint ForwardLightData_NumDirectionalLightCascades;
  const int ForwardLightData_DirectionalLightVSM;
  const int PrePadding_ForwardLightData_120;
  const int PrePadding_ForwardLightData_124;
  const float4 ForwardLightData_CascadeEndDepths;
  const float4x4 ForwardLightData_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 ForwardLightData_DirectionalLightShadowmapMinMax[4];
  const float4 ForwardLightData_DirectionalLightShadowmapAtlasBufferSize;
  const float ForwardLightData_DirectionalLightDepthBias;
  const uint ForwardLightData_DirectionalLightUseStaticShadowing;
  const uint ForwardLightData_SimpleLightsEndIndex;
  const uint ForwardLightData_ClusteredDeferredSupportedEndIndex;
  const uint ForwardLightData_LumenSupportedStartIndex;
  const uint PrePadding_ForwardLightData_500;
  const uint PrePadding_ForwardLightData_504;
  const uint PrePadding_ForwardLightData_508;
  const float4 ForwardLightData_DirectionalLightStaticShadowBufferSize;
  const float4x4 ForwardLightData_DirectionalLightTranslatedWorldToStaticShadow;
  const uint ForwardLightData_DirectLightingShowFlag;
  const float PrePadding_ForwardLightData_DirectionalLightSMRTSettings_596;
  const float PrePadding_ForwardLightData_DirectionalLightSMRTSettings_600;
  const float PrePadding_ForwardLightData_DirectionalLightSMRTSettings_604;
  const float ForwardLightData_DirectionalLightSMRTSettings_ScreenRayLength;
  const int ForwardLightData_DirectionalLightSMRTSettings_SMRTRayCount;
  const int ForwardLightData_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float ForwardLightData_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float ForwardLightData_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float ForwardLightData_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float ForwardLightData_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float ForwardLightData_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint ForwardLightData_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_ForwardLightData_644;
  const uint PrePadding_ForwardLightData_648;
  const uint PrePadding_ForwardLightData_652;
  const uint BindlessResource_ForwardLightData_DirectionalLightShadowmapAtlas;
  const uint PrePadding_ForwardLightData_660;
  const uint BindlessSampler_ForwardLightData_ShadowmapSampler;
  const uint PrePadding_ForwardLightData_668;
  const uint BindlessResource_ForwardLightData_DirectionalLightStaticShadowmap;
  const uint PrePadding_ForwardLightData_676;
  const uint BindlessSampler_ForwardLightData_StaticShadowmapSampler;
  const uint PrePadding_ForwardLightData_684;
  const uint BindlessResource_ForwardLightData_ForwardLocalLightBuffer;
  const uint PrePadding_ForwardLightData_692;
  const uint BindlessResource_ForwardLightData_NumCulledLightsGrid;
  const uint PrePadding_ForwardLightData_700;
  const uint BindlessResource_ForwardLightData_CulledLightDataGrid32Bit;
  const uint PrePadding_ForwardLightData_708;
  const uint BindlessResource_ForwardLightData_CulledLightDataGrid16Bit;
}
#line 3 "/Engine/Generated/UniformBuffers/PlanarReflectionStruct.ush"
cbuffer PlanarReflectionStruct {
  const float4 PlanarReflectionStruct_ReflectionPlane;
  const float4 PlanarReflectionStruct_PlanarReflectionOrigin;
  const float4 PlanarReflectionStruct_PlanarReflectionXAxis;
  const float4 PlanarReflectionStruct_PlanarReflectionYAxis;
  const float3x4 PlanarReflectionStruct_InverseTransposeMirrorMatrix;
  const float3 PlanarReflectionStruct_PlanarReflectionParameters;
  const float PrePadding_PlanarReflectionStruct_124;
  const float2 PlanarReflectionStruct_PlanarReflectionParameters2;
  const float PrePadding_PlanarReflectionStruct_136;
  const float PrePadding_PlanarReflectionStruct_140;
  const float4x4 PlanarReflectionStruct_ProjectionWithExtraFOV[2];
  const float4 PlanarReflectionStruct_PlanarReflectionScreenScaleBias[2];
  const float2 PlanarReflectionStruct_PlanarReflectionScreenBound;
  const uint PlanarReflectionStruct_bIsStereo;
  const uint PrePadding_PlanarReflectionStruct_316;
  const uint BindlessResource_PlanarReflectionStruct_PlanarReflectionTexture;
  const uint PrePadding_PlanarReflectionStruct_324;
  const uint BindlessSampler_PlanarReflectionStruct_PlanarReflectionSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/DeferredLightUniforms.ush"
cbuffer DeferredLightUniforms {
  const float4 DeferredLightUniforms_ShadowMapChannelMask;
  const float2 DeferredLightUniforms_DistanceFadeMAD;
  const float DeferredLightUniforms_ContactShadowLength;
  const float DeferredLightUniforms_ContactShadowCastingIntensity;
  const float DeferredLightUniforms_ContactShadowNonCastingIntensity;
  const float DeferredLightUniforms_VolumetricScatteringIntensity;
  const uint DeferredLightUniforms_ShadowedBits;
  const uint DeferredLightUniforms_LightingChannelMask;
  const float3 DeferredLightUniforms_TranslatedWorldPosition;
  const float DeferredLightUniforms_InvRadius;
  const float3 DeferredLightUniforms_Color;
  const float DeferredLightUniforms_FalloffExponent;
  const float3 DeferredLightUniforms_Direction;
  const float DeferredLightUniforms_SpecularScale;
  const float3 DeferredLightUniforms_Tangent;
  const float DeferredLightUniforms_SourceRadius;
  const float2 DeferredLightUniforms_SpotAngles;
  const float DeferredLightUniforms_SoftSourceRadius;
  const float DeferredLightUniforms_SourceLength;
  const float DeferredLightUniforms_RectLightBarnCosAngle;
  const float DeferredLightUniforms_RectLightBarnLength;
  const float2 DeferredLightUniforms_RectLightAtlasUVOffset;
  const float2 DeferredLightUniforms_RectLightAtlasUVScale;
  const float DeferredLightUniforms_RectLightAtlasMaxLevel;
  const float DeferredLightUniforms_IESAtlasIndex;
}
#line 3 "/Engine/Generated/UniformBuffers/VirtualShadowMap.ush"
cbuffer VirtualShadowMap {
  const uint VirtualShadowMap_NumFullShadowMaps;
  const uint VirtualShadowMap_NumSinglePageShadowMaps;
  const uint VirtualShadowMap_MaxPhysicalPages;
  const uint VirtualShadowMap_NumShadowMapSlots;
  const uint VirtualShadowMap_StaticCachedArrayIndex;
  const uint VirtualShadowMap_PhysicalPageRowMask;
  const uint VirtualShadowMap_PhysicalPageRowShift;
  const uint VirtualShadowMap_PackedShadowMaskMaxLightCount;
  const float4 VirtualShadowMap_RecPhysicalPoolSize;
  const int2 VirtualShadowMap_PhysicalPoolSize;
  const int2 VirtualShadowMap_PhysicalPoolSizePages;
  const uint VirtualShadowMap_bExcludeNonNaniteFromCoarsePages;
  const float VirtualShadowMap_CoarsePagePixelThresholdDynamic;
  const float VirtualShadowMap_CoarsePagePixelThresholdStatic;
  const float VirtualShadowMap_CoarsePagePixelThresholdDynamicNanite;
  const uint BindlessResource_VirtualShadowMap_ProjectionData;
  const uint PrePadding_VirtualShadowMap_84;
  const uint BindlessResource_VirtualShadowMap_PageTable;
  const uint PrePadding_VirtualShadowMap_92;
  const uint BindlessResource_VirtualShadowMap_PageFlags;
  const uint PrePadding_VirtualShadowMap_100;
  const uint BindlessResource_VirtualShadowMap_PageRectBounds;
  const uint PrePadding_VirtualShadowMap_108;
  const uint BindlessResource_VirtualShadowMap_PhysicalPagePool;
}
#line 3 "/Engine/Generated/UniformBuffers/MobileBasePass.ush"
cbuffer MobileBasePass {
  const float MobileBasePass_AmbientOcclusionStaticFraction;
  const float PrePadding_MobileBasePass_Fog_4;
  const float PrePadding_MobileBasePass_Fog_8;
  const float PrePadding_MobileBasePass_Fog_12;
  const float4 MobileBasePass_Fog_ExponentialFogParameters;
  const float4 MobileBasePass_Fog_ExponentialFogParameters2;
  const float4 MobileBasePass_Fog_ExponentialFogColorParameter;
  const float4 MobileBasePass_Fog_ExponentialFogParameters3;
  const float4 MobileBasePass_Fog_SkyAtmosphereAmbientContributionColorScale;
  const float4 MobileBasePass_Fog_InscatteringLightDirection;
  const float4 MobileBasePass_Fog_DirectionalInscatteringColor;
  const float2 MobileBasePass_Fog_SinCosInscatteringColorCubemapRotation;
  const float PrePadding_MobileBasePass_Fog_136;
  const float PrePadding_MobileBasePass_Fog_140;
  const float3 MobileBasePass_Fog_FogInscatteringTextureParameters;
  const float MobileBasePass_Fog_ApplyVolumetricFog;
  const float MobileBasePass_Fog_VolumetricFogStartDistance;
  const float MobileBasePass_Fog_VolumetricFogNearFadeInDistanceInv;
  const uint BindlessResource_MobileBasePass_Fog_FogInscatteringColorCubemap;
  const uint PrePadding_MobileBasePass_Fog_172;
  const uint BindlessSampler_MobileBasePass_Fog_FogInscatteringColorSampler;
  const uint PrePadding_MobileBasePass_Fog_180;
  const uint BindlessResource_MobileBasePass_Fog_IntegratedLightScattering;
  const uint PrePadding_MobileBasePass_Fog_188;
  const uint BindlessSampler_MobileBasePass_Fog_IntegratedLightScatteringSampler;
  const float PrePadding_MobileBasePass_Forward_196;
  const float PrePadding_MobileBasePass_Forward_200;
  const float PrePadding_MobileBasePass_Forward_204;
  const uint MobileBasePass_Forward_NumLocalLights;
  const uint MobileBasePass_Forward_NumReflectionCaptures;
  const uint MobileBasePass_Forward_HasDirectionalLight;
  const uint MobileBasePass_Forward_NumGridCells;
  const int3 MobileBasePass_Forward_CulledGridSize;
  const uint MobileBasePass_Forward_MaxCulledLightsPerCell;
  const uint MobileBasePass_Forward_LightGridPixelSizeShift;
  const uint PrePadding_MobileBasePass_Forward_244;
  const uint PrePadding_MobileBasePass_Forward_248;
  const uint PrePadding_MobileBasePass_Forward_252;
  const float3 MobileBasePass_Forward_LightGridZParams;
  const float PrePadding_MobileBasePass_Forward_268;
  const float3 MobileBasePass_Forward_DirectionalLightDirection;
  const float MobileBasePass_Forward_DirectionalLightSourceRadius;
  const float3 MobileBasePass_Forward_DirectionalLightColor;
  const float MobileBasePass_Forward_DirectionalLightVolumetricScatteringIntensity;
  const uint MobileBasePass_Forward_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_MobileBasePass_Forward_308;
  const float2 MobileBasePass_Forward_DirectionalLightDistanceFadeMAD;
  const uint MobileBasePass_Forward_NumDirectionalLightCascades;
  const int MobileBasePass_Forward_DirectionalLightVSM;
  const int PrePadding_MobileBasePass_Forward_328;
  const int PrePadding_MobileBasePass_Forward_332;
  const float4 MobileBasePass_Forward_CascadeEndDepths;
  const float4x4 MobileBasePass_Forward_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 MobileBasePass_Forward_DirectionalLightShadowmapMinMax[4];
  const float4 MobileBasePass_Forward_DirectionalLightShadowmapAtlasBufferSize;
  const float MobileBasePass_Forward_DirectionalLightDepthBias;
  const uint MobileBasePass_Forward_DirectionalLightUseStaticShadowing;
  const uint MobileBasePass_Forward_SimpleLightsEndIndex;
  const uint MobileBasePass_Forward_ClusteredDeferredSupportedEndIndex;
  const uint MobileBasePass_Forward_LumenSupportedStartIndex;
  const uint PrePadding_MobileBasePass_Forward_708;
  const uint PrePadding_MobileBasePass_Forward_712;
  const uint PrePadding_MobileBasePass_Forward_716;
  const float4 MobileBasePass_Forward_DirectionalLightStaticShadowBufferSize;
  const float4x4 MobileBasePass_Forward_DirectionalLightTranslatedWorldToStaticShadow;
  const uint MobileBasePass_Forward_DirectLightingShowFlag;
  const float PrePadding_MobileBasePass_Forward_DirectionalLightSMRTSettings_804;
  const float PrePadding_MobileBasePass_Forward_DirectionalLightSMRTSettings_808;
  const float PrePadding_MobileBasePass_Forward_DirectionalLightSMRTSettings_812;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_ScreenRayLength;
  const int MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTRayCount;
  const int MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint MobileBasePass_Forward_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_MobileBasePass_Forward_852;
  const uint PrePadding_MobileBasePass_Forward_856;
  const uint PrePadding_MobileBasePass_Forward_860;
  const uint BindlessResource_MobileBasePass_Forward_DirectionalLightShadowmapAtlas;
  const uint PrePadding_MobileBasePass_Forward_868;
  const uint BindlessSampler_MobileBasePass_Forward_ShadowmapSampler;
  const uint PrePadding_MobileBasePass_Forward_876;
  const uint BindlessResource_MobileBasePass_Forward_DirectionalLightStaticShadowmap;
  const uint PrePadding_MobileBasePass_Forward_884;
  const uint BindlessSampler_MobileBasePass_Forward_StaticShadowmapSampler;
  const uint PrePadding_MobileBasePass_Forward_892;
  const uint BindlessResource_MobileBasePass_Forward_ForwardLocalLightBuffer;
  const uint PrePadding_MobileBasePass_Forward_900;
  const uint BindlessResource_MobileBasePass_Forward_NumCulledLightsGrid;
  const uint PrePadding_MobileBasePass_Forward_908;
  const uint BindlessResource_MobileBasePass_Forward_CulledLightDataGrid32Bit;
  const uint PrePadding_MobileBasePass_Forward_916;
  const uint BindlessResource_MobileBasePass_Forward_CulledLightDataGrid16Bit;
  const float PrePadding_MobileBasePass_ForwardMMV_924;
  const uint MobileBasePass_ForwardMMV_NumLocalLights;
  const uint MobileBasePass_ForwardMMV_NumReflectionCaptures;
  const uint MobileBasePass_ForwardMMV_HasDirectionalLight;
  const uint MobileBasePass_ForwardMMV_NumGridCells;
  const int3 MobileBasePass_ForwardMMV_CulledGridSize;
  const uint MobileBasePass_ForwardMMV_MaxCulledLightsPerCell;
  const uint MobileBasePass_ForwardMMV_LightGridPixelSizeShift;
  const uint PrePadding_MobileBasePass_ForwardMMV_964;
  const uint PrePadding_MobileBasePass_ForwardMMV_968;
  const uint PrePadding_MobileBasePass_ForwardMMV_972;
  const float3 MobileBasePass_ForwardMMV_LightGridZParams;
  const float PrePadding_MobileBasePass_ForwardMMV_988;
  const float3 MobileBasePass_ForwardMMV_DirectionalLightDirection;
  const float MobileBasePass_ForwardMMV_DirectionalLightSourceRadius;
  const float3 MobileBasePass_ForwardMMV_DirectionalLightColor;
  const float MobileBasePass_ForwardMMV_DirectionalLightVolumetricScatteringIntensity;
  const uint MobileBasePass_ForwardMMV_DirectionalLightShadowMapChannelMask;
  const uint PrePadding_MobileBasePass_ForwardMMV_1028;
  const float2 MobileBasePass_ForwardMMV_DirectionalLightDistanceFadeMAD;
  const uint MobileBasePass_ForwardMMV_NumDirectionalLightCascades;
  const int MobileBasePass_ForwardMMV_DirectionalLightVSM;
  const int PrePadding_MobileBasePass_ForwardMMV_1048;
  const int PrePadding_MobileBasePass_ForwardMMV_1052;
  const float4 MobileBasePass_ForwardMMV_CascadeEndDepths;
  const float4x4 MobileBasePass_ForwardMMV_DirectionalLightTranslatedWorldToShadowMatrix[4];
  const float4 MobileBasePass_ForwardMMV_DirectionalLightShadowmapMinMax[4];
  const float4 MobileBasePass_ForwardMMV_DirectionalLightShadowmapAtlasBufferSize;
  const float MobileBasePass_ForwardMMV_DirectionalLightDepthBias;
  const uint MobileBasePass_ForwardMMV_DirectionalLightUseStaticShadowing;
  const uint MobileBasePass_ForwardMMV_SimpleLightsEndIndex;
  const uint MobileBasePass_ForwardMMV_ClusteredDeferredSupportedEndIndex;
  const uint MobileBasePass_ForwardMMV_LumenSupportedStartIndex;
  const uint PrePadding_MobileBasePass_ForwardMMV_1428;
  const uint PrePadding_MobileBasePass_ForwardMMV_1432;
  const uint PrePadding_MobileBasePass_ForwardMMV_1436;
  const float4 MobileBasePass_ForwardMMV_DirectionalLightStaticShadowBufferSize;
  const float4x4 MobileBasePass_ForwardMMV_DirectionalLightTranslatedWorldToStaticShadow;
  const uint MobileBasePass_ForwardMMV_DirectLightingShowFlag;
  const float PrePadding_MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_1524;
  const float PrePadding_MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_1528;
  const float PrePadding_MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_1532;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_ScreenRayLength;
  const int MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTRayCount;
  const int MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTSamplesPerRay;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTRayLengthScale;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTCotMaxRayAngleFromLight;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTTexelDitherScale;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTExtrapolateSlope;
  const float MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTMaxSlopeBias;
  const uint MobileBasePass_ForwardMMV_DirectionalLightSMRTSettings_SMRTAdaptiveRayCount;
  const uint PrePadding_MobileBasePass_ForwardMMV_1572;
  const uint PrePadding_MobileBasePass_ForwardMMV_1576;
  const uint PrePadding_MobileBasePass_ForwardMMV_1580;
  const uint BindlessResource_MobileBasePass_ForwardMMV_DirectionalLightShadowmapAtlas;
  const uint PrePadding_MobileBasePass_ForwardMMV_1588;
  const uint BindlessSampler_MobileBasePass_ForwardMMV_ShadowmapSampler;
  const uint PrePadding_MobileBasePass_ForwardMMV_1596;
  const uint BindlessResource_MobileBasePass_ForwardMMV_DirectionalLightStaticShadowmap;
  const uint PrePadding_MobileBasePass_ForwardMMV_1604;
  const uint BindlessSampler_MobileBasePass_ForwardMMV_StaticShadowmapSampler;
  const uint PrePadding_MobileBasePass_ForwardMMV_1612;
  const uint BindlessResource_MobileBasePass_ForwardMMV_ForwardLocalLightBuffer;
  const uint PrePadding_MobileBasePass_ForwardMMV_1620;
  const uint BindlessResource_MobileBasePass_ForwardMMV_NumCulledLightsGrid;
  const uint PrePadding_MobileBasePass_ForwardMMV_1628;
  const uint BindlessResource_MobileBasePass_ForwardMMV_CulledLightDataGrid32Bit;
  const uint PrePadding_MobileBasePass_ForwardMMV_1636;
  const uint BindlessResource_MobileBasePass_ForwardMMV_CulledLightDataGrid16Bit;
  const float PrePadding_MobileBasePass_PlanarReflection_1644;
  const float4 MobileBasePass_PlanarReflection_ReflectionPlane;
  const float4 MobileBasePass_PlanarReflection_PlanarReflectionOrigin;
  const float4 MobileBasePass_PlanarReflection_PlanarReflectionXAxis;
  const float4 MobileBasePass_PlanarReflection_PlanarReflectionYAxis;
  const float3x4 MobileBasePass_PlanarReflection_InverseTransposeMirrorMatrix;
  const float3 MobileBasePass_PlanarReflection_PlanarReflectionParameters;
  const float PrePadding_MobileBasePass_PlanarReflection_1772;
  const float2 MobileBasePass_PlanarReflection_PlanarReflectionParameters2;
  const float PrePadding_MobileBasePass_PlanarReflection_1784;
  const float PrePadding_MobileBasePass_PlanarReflection_1788;
  const float4x4 MobileBasePass_PlanarReflection_ProjectionWithExtraFOV[2];
  const float4 MobileBasePass_PlanarReflection_PlanarReflectionScreenScaleBias[2];
  const float2 MobileBasePass_PlanarReflection_PlanarReflectionScreenBound;
  const uint MobileBasePass_PlanarReflection_bIsStereo;
  const uint PrePadding_MobileBasePass_PlanarReflection_1964;
  const uint BindlessResource_MobileBasePass_PlanarReflection_PlanarReflectionTexture;
  const uint PrePadding_MobileBasePass_PlanarReflection_1972;
  const uint BindlessSampler_MobileBasePass_PlanarReflection_PlanarReflectionSampler;
  const float PrePadding_MobileBasePass_SceneTextures_1980;
  const uint BindlessResource_MobileBasePass_SceneTextures_SceneColorTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_1988;
  const uint BindlessSampler_MobileBasePass_SceneTextures_SceneColorTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_1996;
  const uint BindlessResource_MobileBasePass_SceneTextures_SceneDepthTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2004;
  const uint BindlessSampler_MobileBasePass_SceneTextures_SceneDepthTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2012;
  const uint BindlessResource_MobileBasePass_SceneTextures_ScenePartialDepthTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2020;
  const uint BindlessSampler_MobileBasePass_SceneTextures_ScenePartialDepthTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2028;
  const uint BindlessResource_MobileBasePass_SceneTextures_CustomDepthTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2036;
  const uint BindlessSampler_MobileBasePass_SceneTextures_CustomDepthTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2044;
  const uint BindlessResource_MobileBasePass_SceneTextures_CustomStencilTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2052;
  const uint BindlessResource_MobileBasePass_SceneTextures_SceneVelocityTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2060;
  const uint BindlessSampler_MobileBasePass_SceneTextures_SceneVelocityTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2068;
  const uint BindlessResource_MobileBasePass_SceneTextures_GBufferATexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2076;
  const uint BindlessResource_MobileBasePass_SceneTextures_GBufferBTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2084;
  const uint BindlessResource_MobileBasePass_SceneTextures_GBufferCTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2092;
  const uint BindlessResource_MobileBasePass_SceneTextures_GBufferDTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2100;
  const uint BindlessResource_MobileBasePass_SceneTextures_SceneDepthAuxTexture;
  const uint PrePadding_MobileBasePass_SceneTextures_2108;
  const uint BindlessResource_MobileBasePass_SceneTextures_LocalLightTextureA;
  const uint PrePadding_MobileBasePass_SceneTextures_2116;
  const uint BindlessResource_MobileBasePass_SceneTextures_LocalLightTextureB;
  const uint PrePadding_MobileBasePass_SceneTextures_2124;
  const uint BindlessSampler_MobileBasePass_SceneTextures_GBufferATextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2132;
  const uint BindlessSampler_MobileBasePass_SceneTextures_GBufferBTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2140;
  const uint BindlessSampler_MobileBasePass_SceneTextures_GBufferCTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2148;
  const uint BindlessSampler_MobileBasePass_SceneTextures_GBufferDTextureSampler;
  const uint PrePadding_MobileBasePass_SceneTextures_2156;
  const uint BindlessSampler_MobileBasePass_SceneTextures_SceneDepthAuxTextureSampler;
  const float PrePadding_MobileBasePass_Strata_2164;
  const float PrePadding_MobileBasePass_Strata_2168;
  const float PrePadding_MobileBasePass_Strata_2172;
  const uint MobileBasePass_Strata_MaxBytesPerPixel;
  const uint MobileBasePass_Strata_bRoughDiffuse;
  const uint MobileBasePass_Strata_PeelLayersAboveDepth;
  const uint MobileBasePass_Strata_bRoughnessTracking;
  const float4 MobileBasePass_DebugViewMode_AccuracyColors[5];
  const float4 MobileBasePass_DebugViewMode_LODColors[8];
  const uint BindlessResource_MobileBasePass_QuadOverdraw;
  const float PrePadding_MobileBasePass_ReflectionsParameters_2404;
  const float PrePadding_MobileBasePass_ReflectionsParameters_2408;
  const float PrePadding_MobileBasePass_ReflectionsParameters_2412;
  const float4 MobileBasePass_ReflectionsParameters_SkyLightParameters;
  const uint BindlessResource_MobileBasePass_ReflectionsParameters_SkyLightCubemap;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2436;
  const uint BindlessSampler_MobileBasePass_ReflectionsParameters_SkyLightCubemapSampler;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2444;
  const uint BindlessResource_MobileBasePass_ReflectionsParameters_SkyLightBlendDestinationCubemap;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2452;
  const uint BindlessSampler_MobileBasePass_ReflectionsParameters_SkyLightBlendDestinationCubemapSampler;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2460;
  const uint BindlessResource_MobileBasePass_ReflectionsParameters_ReflectionCubemap;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2468;
  const uint BindlessSampler_MobileBasePass_ReflectionsParameters_ReflectionCubemapSampler;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2476;
  const uint BindlessResource_MobileBasePass_ReflectionsParameters_PreIntegratedGF;
  const uint PrePadding_MobileBasePass_ReflectionsParameters_2484;
  const uint BindlessSampler_MobileBasePass_ReflectionsParameters_PreIntegratedGFSampler;
  const uint PrePadding_MobileBasePass_2492;
  const uint BindlessResource_MobileBasePass_PreIntegratedGFTexture;
  const uint PrePadding_MobileBasePass_2500;
  const uint BindlessSampler_MobileBasePass_PreIntegratedGFSampler;
  const uint PrePadding_MobileBasePass_2508;
  const uint BindlessResource_MobileBasePass_EyeAdaptationBuffer;
  const uint PrePadding_MobileBasePass_2516;
  const uint BindlessResource_MobileBasePass_RWOcclusionBufferUAV;
  const uint PrePadding_MobileBasePass_2524;
  const uint BindlessResource_MobileBasePass_AmbientOcclusionTexture;
  const uint PrePadding_MobileBasePass_2532;
  const uint BindlessSampler_MobileBasePass_AmbientOcclusionSampler;
  const uint PrePadding_MobileBasePass_2540;
  const uint BindlessResource_MobileBasePass_ScreenSpaceShadowMaskTexture;
  const uint PrePadding_MobileBasePass_2548;
  const uint BindlessSampler_MobileBasePass_ScreenSpaceShadowMaskSampler;
}
#line 3 "/Engine/Generated/UniformBuffers/PrecomputedLightingBuffer.ush"
cbuffer PrecomputedLightingBuffer {
  const float4 PrecomputedLightingBuffer_StaticShadowMapMasks;
  const float4 PrecomputedLightingBuffer_InvUniformPenumbraSizes;
  const float4 PrecomputedLightingBuffer_LightMapCoordinateScaleBias;
  const float4 PrecomputedLightingBuffer_ShadowMapCoordinateScaleBias;
  const float4 PrecomputedLightingBuffer_LightMapScale[2];
  const float4 PrecomputedLightingBuffer_LightMapAdd[2];
  const uint4 PrecomputedLightingBuffer_LightmapVTPackedPageTableUniform[2];
  const uint4 PrecomputedLightingBuffer_LightmapVTPackedUniform[5];
}
#line 3 "/Engine/Generated/UniformBuffers/NiagaraSpriteVFLooseParameters.ush"
cbuffer NiagaraSpriteVFLooseParameters {
  const uint NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame;
  const uint NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride;
  const uint NiagaraSpriteVFLooseParameters_ParticleAlignmentMode;
  const uint NiagaraSpriteVFLooseParameters_ParticleFacingMode;
  const uint NiagaraSpriteVFLooseParameters_SortedIndicesOffset;
  const uint NiagaraSpriteVFLooseParameters_IndirectArgsOffset;
  const uint BindlessResource_NiagaraSpriteVFLooseParameters_CutoutGeometry;
  const uint PrePadding_NiagaraSpriteVFLooseParameters_28;
  const uint BindlessResource_NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat;
  const uint PrePadding_NiagaraSpriteVFLooseParameters_36;
  const uint BindlessResource_NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf;
  const uint PrePadding_NiagaraSpriteVFLooseParameters_44;
  const uint BindlessResource_NiagaraSpriteVFLooseParameters_SortedIndices;
  const uint PrePadding_NiagaraSpriteVFLooseParameters_52;
  const uint BindlessResource_NiagaraSpriteVFLooseParameters_IndirectArgsBuffer;
}
#line 21 "/Engine/Generated/UniformBuffers/NiagaraSpriteVFLooseParameters.ush"
Buffer<float2> NiagaraSpriteVFLooseParameters_CutoutGeometry;
#line 22 "/Engine/Generated/UniformBuffers/NiagaraSpriteVFLooseParameters.ush"
Buffer<float> NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat;
#line 23 "/Engine/Generated/UniformBuffers/NiagaraSpriteVFLooseParameters.ush"
Buffer<float> NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf;
#line 24 "/Engine/Generated/UniformBuffers/NiagaraSpriteVFLooseParameters.ush"
Buffer<uint> NiagaraSpriteVFLooseParameters_SortedIndices;
#line 3 "/Engine/Generated/UniformBuffers/NiagaraSpriteVF.ush"
cbuffer NiagaraSpriteVF {
  const uint NiagaraSpriteVF_bLocalSpace;
  const uint PrePadding_NiagaraSpriteVF_4;
  const uint PrePadding_NiagaraSpriteVF_8;
  const uint PrePadding_NiagaraSpriteVF_12;
  const float4 NiagaraSpriteVF_TangentSelector;
  const float4 NiagaraSpriteVF_NormalsSphereCenter;
  const float4 NiagaraSpriteVF_NormalsCylinderUnitDirection;
  const float4 NiagaraSpriteVF_SubImageSize;
  const float3 NiagaraSpriteVF_CameraFacingBlend;
  const float NiagaraSpriteVF_RemoveHMDRoll;
  const float4 NiagaraSpriteVF_MacroUVParameters;
  const float NiagaraSpriteVF_RotationScale;
  const float NiagaraSpriteVF_RotationBias;
  const float NiagaraSpriteVF_NormalsType;
  const float NiagaraSpriteVF_DeltaSeconds;
  const float2 NiagaraSpriteVF_DefaultPivotOffset;
  const float2 NiagaraSpriteVF_DefaultPrevPivotOffset;
  const int NiagaraSpriteVF_PositionDataOffset;
  const int NiagaraSpriteVF_PrevPositionDataOffset;
  const int NiagaraSpriteVF_VelocityDataOffset;
  const int NiagaraSpriteVF_PrevVelocityDataOffset;
  const int NiagaraSpriteVF_RotationDataOffset;
  const int NiagaraSpriteVF_PrevRotationDataOffset;
  const int NiagaraSpriteVF_SizeDataOffset;
  const int NiagaraSpriteVF_PrevSizeDataOffset;
  const int NiagaraSpriteVF_SubimageDataOffset;
  const int NiagaraSpriteVF_ColorDataOffset;
  const uint NiagaraSpriteVF_MaterialParamValidMask;
  const int NiagaraSpriteVF_MaterialParamDataOffset;
  const int NiagaraSpriteVF_MaterialParam1DataOffset;
  const int NiagaraSpriteVF_MaterialParam2DataOffset;
  const int NiagaraSpriteVF_MaterialParam3DataOffset;
  const int NiagaraSpriteVF_FacingDataOffset;
  const int NiagaraSpriteVF_PrevFacingDataOffset;
  const int NiagaraSpriteVF_AlignmentDataOffset;
  const int NiagaraSpriteVF_PrevAlignmentDataOffset;
  const int NiagaraSpriteVF_SubImageBlendMode;
  const int NiagaraSpriteVF_CameraOffsetDataOffset;
  const int NiagaraSpriteVF_PrevCameraOffsetDataOffset;
  const int NiagaraSpriteVF_UVScaleDataOffset;
  const int NiagaraSpriteVF_PivotOffsetDataOffset;
  const int NiagaraSpriteVF_PrevPivotOffsetDataOffset;
  const int NiagaraSpriteVF_NormalizedAgeDataOffset;
  const int NiagaraSpriteVF_MaterialRandomDataOffset;
  const int PrePadding_NiagaraSpriteVF_252;
  const float4 NiagaraSpriteVF_DefaultPos;
  const float4 NiagaraSpriteVF_DefaultPrevPos;
  const float2 NiagaraSpriteVF_DefaultSize;
  const float2 NiagaraSpriteVF_DefaultPrevSize;
  const float2 NiagaraSpriteVF_DefaultUVScale;
  const float PrePadding_NiagaraSpriteVF_312;
  const float PrePadding_NiagaraSpriteVF_316;
  const float3 NiagaraSpriteVF_DefaultVelocity;
  const float PrePadding_NiagaraSpriteVF_332;
  const float3 NiagaraSpriteVF_DefaultPrevVelocity;
  const float PrePadding_NiagaraSpriteVF_348;
  const float3 NiagaraSpriteVF_SystemLWCTile;
  const float NiagaraSpriteVF_DefaultRotation;
  const float NiagaraSpriteVF_DefaultPrevRotation;
  const float PrePadding_NiagaraSpriteVF_372;
  const float PrePadding_NiagaraSpriteVF_376;
  const float PrePadding_NiagaraSpriteVF_380;
  const float4 NiagaraSpriteVF_DefaultColor;
  const float NiagaraSpriteVF_DefaultMatRandom;
  const float NiagaraSpriteVF_DefaultCamOffset;
  const float NiagaraSpriteVF_DefaultPrevCamOffset;
  const float NiagaraSpriteVF_DefaultNormAge;
  const float NiagaraSpriteVF_DefaultSubImage;
  const float PrePadding_NiagaraSpriteVF_420;
  const float PrePadding_NiagaraSpriteVF_424;
  const float PrePadding_NiagaraSpriteVF_428;
  const float4 NiagaraSpriteVF_DefaultFacing;
  const float4 NiagaraSpriteVF_DefaultPrevFacing;
  const float4 NiagaraSpriteVF_DefaultAlignment;
  const float4 NiagaraSpriteVF_DefaultPrevAlignment;
  const float4 NiagaraSpriteVF_DefaultDynamicMaterialParameter0;
  const float4 NiagaraSpriteVF_DefaultDynamicMaterialParameter1;
  const float4 NiagaraSpriteVF_DefaultDynamicMaterialParameter2;
  const float4 NiagaraSpriteVF_DefaultDynamicMaterialParameter3;
  const int NiagaraSpriteVF_PixelCoverageEnabled;
  const int PrePadding_NiagaraSpriteVF_564;
  const int PrePadding_NiagaraSpriteVF_568;
  const int PrePadding_NiagaraSpriteVF_572;
  const float4 NiagaraSpriteVF_PixelCoverageColorBlend;
  const int NiagaraSpriteVF_AccurateMotionVectors;
}
#line 3 "/Engine/Generated/UniformBuffers/SpriteVF.ush"
cbuffer SpriteVF {
  const float4 SpriteVF_AxisLockRight;
  const float4 SpriteVF_AxisLockUp;
  const float4 SpriteVF_TangentSelector;
  const float4 SpriteVF_NormalsSphereCenter;
  const float4 SpriteVF_NormalsCylinderUnitDirection;
  const float4 SpriteVF_SubImageSize;
  const float3 SpriteVF_CameraFacingBlend;
  const float SpriteVF_RemoveHMDRoll;
  const float4 SpriteVF_MacroUVParameters;
  const float SpriteVF_RotationScale;
  const float SpriteVF_RotationBias;
  const float SpriteVF_NormalsType;
  const float SpriteVF_InvDeltaSeconds;
  const float3 SpriteVF_LWCTile;
  const float PrePadding_SpriteVF_156;
  const float2 SpriteVF_PivotOffset;
  const float SpriteVF_UseVelocityForMotionBlur;
}
#line 3 "/Engine/Generated/UniformBuffers/Material.ush"
cbuffer Material {
  const float4 Material_PreshaderBuffer[3];
  const uint BindlessSampler_Material_Wrap_WorldGroupSettings;
  const uint PrePadding_Material_52;
  const uint BindlessSampler_Material_Clamp_WorldGroupSettings;
}
#line 12 "/Engine/Private/CommonViewUniformBuffer.ush"
float2 GetTanHalfFieldOfView() {
  return View_TanAndInvTanHalfFOV.xy;
}


#line 1 "/Engine/Generated/GeneratedInstancedStereo.ush"
struct ViewState {
  float4x4 TranslatedWorldToClip;
  float4x4 RelativeWorldToClip;
  float4x4 ClipToRelativeWorld;
  float4x4 TranslatedWorldToView;
  float4x4 ViewToTranslatedWorld;
  float4x4 TranslatedWorldToCameraView;
  float4x4 CameraViewToTranslatedWorld;
  float4x4 ViewToClip;
  float4x4 ViewToClipNoAA;
  float4x4 ClipToView;
  float4x4 ClipToTranslatedWorld;
  float4x4 SVPositionToTranslatedWorld;
  float4x4 ScreenToRelativeWorld;
  float4x4 ScreenToTranslatedWorld;
  float4x4 MobileMultiviewShadowTransform;
  float3 ViewTilePosition;
  float3 MatrixTilePosition;
  float3 ViewForward;
  float3 ViewUp;
  float3 ViewRight;
  float3 HMDViewNoRollUp;
  float3 HMDViewNoRollRight;
  float4 InvDeviceZToWorldZTransform;
  float4 ScreenPositionScaleBias;
  float3 RelativeWorldCameraOrigin;
  float3 TranslatedWorldCameraOrigin;
  float3 RelativeWorldViewOrigin;
  float3 RelativePreViewTranslation;
  float4x4 PrevViewToClip;
  float4x4 PrevClipToView;
  float4x4 PrevTranslatedWorldToClip;
  float4x4 PrevTranslatedWorldToView;
  float4x4 PrevViewToTranslatedWorld;
  float4x4 PrevTranslatedWorldToCameraView;
  float4x4 PrevCameraViewToTranslatedWorld;
  float3 PrevTranslatedWorldCameraOrigin;
  float3 PrevRelativeWorldCameraOrigin;
  float3 PrevRelativeWorldViewOrigin;
  float3 RelativePrevPreViewTranslation;
  float4x4 PrevClipToRelativeWorld;
  float4x4 PrevScreenToTranslatedWorld;
  float4x4 ClipToPrevClip;
  float4x4 ClipToPrevClipWithAA;
  float4 TemporalAAJitter;
  float4 GlobalClippingPlane;
  float2 FieldOfViewWideAngles;
  float2 PrevFieldOfViewWideAngles;
  float4 ViewRectMin;
  float4 ViewSizeAndInvSize;
  uint4 ViewRectMinAndSize;
  float4 LightProbeSizeRatioAndInvSizeRatio;
  float4 BufferSizeAndInvSize;
  float4 BufferBilinearUVMinMax;
  float4 ScreenToViewSpace;
  float2 BufferToSceneTextureScale;
  float2 ResolutionFractionAndInv;
  int NumSceneColorMSAASamples;
  float ProjectionDepthThicknessScale;
  float PreExposure;
  float OneOverPreExposure;
  float4 DiffuseOverrideParameter;
  float4 SpecularOverrideParameter;
  float4 NormalOverrideParameter;
  float2 RoughnessOverrideParameter;
  float PrevFrameGameTime;
  float PrevFrameRealTime;
  float OutOfBoundsMask;
  float3 WorldCameraMovementSinceLastFrame;
  float CullingSign;
  float NearPlane;
  float GameTime;
  float RealTime;
  float DeltaTime;
  float MaterialTextureMipBias;
  float MaterialTextureDerivativeMultiply;
  uint Random;
  uint FrameNumber;
  uint FrameCounter;
  uint StateFrameIndexMod8;
  uint StateFrameIndex;
  uint DebugViewModeMask;
  uint WorldIsPaused;
  float CameraCut;
  float UnlitViewmodeMask;
  float4 DirectionalLightColor;
  float3 DirectionalLightDirection;
  float4 TranslucencyLightingVolumeMin[2];
  float4 TranslucencyLightingVolumeInvSize[2];
  float4 TemporalAAParams;
  float4 CircleDOFParams;
  float DepthOfFieldSensorWidth;
  float DepthOfFieldFocalDistance;
  float DepthOfFieldScale;
  float DepthOfFieldFocalLength;
  float DepthOfFieldFocalRegion;
  float DepthOfFieldNearTransitionRegion;
  float DepthOfFieldFarTransitionRegion;
  float MotionBlurNormalizedToPixel;
  float GeneralPurposeTweak;
  float GeneralPurposeTweak2;
  float DemosaicVposOffset;
  float DecalDepthBias;
  float3 IndirectLightingColorScale;
  float3 PrecomputedIndirectLightingColorScale;
  float3 PrecomputedIndirectSpecularColorScale;
  float4 AtmosphereLightDirection[2];
  float4 AtmosphereLightIlluminanceOnGroundPostTransmittance[2];
  float4 AtmosphereLightIlluminanceOuterSpace[2];
  float4 AtmosphereLightDiscLuminance[2];
  float4 AtmosphereLightDiscCosHalfApexAngle_PPTrans[2];
  float4 SkyViewLutSizeAndInvSize;
  float3 SkyCameraTranslatedWorldOrigin;
  float4 SkyPlanetTranslatedWorldCenterAndViewHeight;
  float4x4 SkyViewLutReferential;
  float4 SkyAtmosphereSkyLuminanceFactor;
  float SkyAtmospherePresentInScene;
  float SkyAtmosphereHeightFogContribution;
  float SkyAtmosphereBottomRadiusKm;
  float SkyAtmosphereTopRadiusKm;
  float4 SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
  float SkyAtmosphereAerialPerspectiveStartDepthKm;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm;
  float SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
  float SkyAtmosphereApplyCameraAerialPerspectiveVolume;
  float3 NormalCurvatureToRoughnessScaleBias;
  float RenderingReflectionCaptureMask;
  float RealTimeReflectionCapture;
  float RealTimeReflectionCapturePreExposure;
  float4 AmbientCubemapTint;
  float AmbientCubemapIntensity;
  float SkyLightApplyPrecomputedBentNormalShadowingFlag;
  float SkyLightAffectReflectionFlag;
  float SkyLightAffectGlobalIlluminationFlag;
  float4 SkyLightColor;
  float4 MobileSkyIrradianceEnvironmentMap[8];
  float MobilePreviewMode;
  float HMDEyePaddingOffset;
  float ReflectionCubemapMaxMip;
  float ShowDecalsMask;
  uint DistanceFieldAOSpecularOcclusionMode;
  float IndirectCapsuleSelfShadowingIntensity;
  float3 ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
  int StereoPassIndex;
  float4 GlobalVolumeTranslatedCenterAndExtent[6];
  float4 GlobalVolumeTranslatedWorldToUVAddAndMul[6];
  float4 GlobalDistanceFieldMipTranslatedWorldToUVScale[6];
  float4 GlobalDistanceFieldMipTranslatedWorldToUVBias[6];
  float GlobalDistanceFieldMipFactor;
  float GlobalDistanceFieldMipTransition;
  int GlobalDistanceFieldClipmapSizeInPages;
  float3 GlobalDistanceFieldInvPageAtlasSize;
  float3 GlobalDistanceFieldInvCoverageAtlasSize;
  float GlobalVolumeDimension;
  float GlobalVolumeTexelSize;
  float MaxGlobalDFAOConeDistance;
  uint NumGlobalSDFClipmaps;
  float CoveredExpandSurfaceScale;
  float NotCoveredExpandSurfaceScale;
  float NotCoveredMinStepScale;
  float DitheredTransparencyStepThreshold;
  float DitheredTransparencyTraceThreshold;
  int2 CursorPosition;
  float bCheckerboardSubsurfaceProfileRendering;
  float3 VolumetricFogInvGridSize;
  float3 VolumetricFogGridZParams;
  float2 VolumetricFogSVPosToVolumeUV;
  float2 VolumetricFogViewGridUVToPrevViewRectUV;
  float2 VolumetricFogPrevViewGridRectUVToResourceUV;
  float2 VolumetricFogPrevUVMax;
  float2 VolumetricFogScreenToResourceUV;
  float2 VolumetricFogUVMax;
  float VolumetricFogMaxDistance;
  float3 VolumetricLightmapWorldToUVScale;
  float3 VolumetricLightmapWorldToUVAdd;
  float3 VolumetricLightmapIndirectionTextureSize;
  float VolumetricLightmapBrickSize;
  float3 VolumetricLightmapBrickTexelSize;
  float IndirectLightingCacheShowFlag;
  float EyeToPixelSpreadAngle;
  float4 XRPassthroughCameraUVs[2];
  float GlobalVirtualTextureMipBias;
  uint VirtualTextureFeedbackShift;
  uint VirtualTextureFeedbackMask;
  uint VirtualTextureFeedbackStride;
  uint VirtualTextureFeedbackJitterOffset;
  uint VirtualTextureFeedbackSampleOffset;
  float4 RuntimeVirtualTextureMipLevel;
  float2 RuntimeVirtualTexturePackHeight;
  float4 RuntimeVirtualTextureDebugParams;
  float OverrideLandscapeLOD;
  int FarShadowStaticMeshLODBias;
  float MinRoughness;
  float4 HairRenderInfo;
  uint EnableSkyLight;
  uint HairRenderInfoBits;
  uint HairComponents;
  float bSubsurfacePostprocessEnabled;
  float4 SSProfilesTextureSizeAndInvSize;
  float4 SSProfilesPreIntegratedTextureSizeAndInvSize;
  float4 SpecularProfileTextureSizeAndInvSize;
  float3 PhysicsFieldClipmapCenter;
  float PhysicsFieldClipmapDistance;
  int PhysicsFieldClipmapResolution;
  int PhysicsFieldClipmapExponent;
  int PhysicsFieldClipmapCount;
  int PhysicsFieldTargetCount;
  int4 PhysicsFieldTargets[32];
  uint GPUSceneViewId;
  float ViewResolutionFraction;
  float SubSurfaceColorAsTransmittanceAtDistanceInMeters;
  float4 TanAndInvTanHalfFOV;
  float4 PrevTanAndInvTanHalfFOV;
  float4 GlintLUTParameters0;
  float4 GlintLUTParameters1;
  FLWCInverseMatrix WorldToClip;
  FLWCMatrix ClipToWorld;
  FLWCMatrix ScreenToWorld;
  FLWCMatrix PrevClipToWorld;
  FLWCVector3 WorldCameraOrigin;
  FLWCVector3 WorldViewOrigin;
  FLWCVector3 PrevWorldCameraOrigin;
  FLWCVector3 PrevWorldViewOrigin;
  FLWCVector3 PreViewTranslation;
  FLWCVector3 PrevPreViewTranslation;
};
#line 230 "/Engine/Generated/GeneratedInstancedStereo.ush"
void FinalizeViewState(inout ViewState InOutView);
#line 231 "/Engine/Generated/GeneratedInstancedStereo.ush"
ViewState GetPrimaryView() {
  ViewState Result;
  Result.TranslatedWorldToClip = View_TranslatedWorldToClip;
  Result.RelativeWorldToClip = View_RelativeWorldToClip;
  Result.ClipToRelativeWorld = View_ClipToRelativeWorld;
  Result.TranslatedWorldToView = View_TranslatedWorldToView;
  Result.ViewToTranslatedWorld = View_ViewToTranslatedWorld;
  Result.TranslatedWorldToCameraView = View_TranslatedWorldToCameraView;
  Result.CameraViewToTranslatedWorld = View_CameraViewToTranslatedWorld;
  Result.ViewToClip = View_ViewToClip;
  Result.ViewToClipNoAA = View_ViewToClipNoAA;
  Result.ClipToView = View_ClipToView;
  Result.ClipToTranslatedWorld = View_ClipToTranslatedWorld;
  Result.SVPositionToTranslatedWorld = View_SVPositionToTranslatedWorld;
  Result.ScreenToRelativeWorld = View_ScreenToRelativeWorld;
  Result.ScreenToTranslatedWorld = View_ScreenToTranslatedWorld;
  Result.MobileMultiviewShadowTransform = View_MobileMultiviewShadowTransform;
  Result.ViewTilePosition = View_ViewTilePosition;
  Result.MatrixTilePosition = View_MatrixTilePosition;
  Result.ViewForward = View_ViewForward;
  Result.ViewUp = View_ViewUp;
  Result.ViewRight = View_ViewRight;
  Result.HMDViewNoRollUp = View_HMDViewNoRollUp;
  Result.HMDViewNoRollRight = View_HMDViewNoRollRight;
  Result.InvDeviceZToWorldZTransform = View_InvDeviceZToWorldZTransform;
  Result.ScreenPositionScaleBias = View_ScreenPositionScaleBias;
  Result.RelativeWorldCameraOrigin = View_RelativeWorldCameraOrigin;
  Result.TranslatedWorldCameraOrigin = View_TranslatedWorldCameraOrigin;
  Result.RelativeWorldViewOrigin = View_RelativeWorldViewOrigin;
  Result.RelativePreViewTranslation = View_RelativePreViewTranslation;
  Result.PrevViewToClip = View_PrevViewToClip;
  Result.PrevClipToView = View_PrevClipToView;
  Result.PrevTranslatedWorldToClip = View_PrevTranslatedWorldToClip;
  Result.PrevTranslatedWorldToView = View_PrevTranslatedWorldToView;
  Result.PrevViewToTranslatedWorld = View_PrevViewToTranslatedWorld;
  Result.PrevTranslatedWorldToCameraView = View_PrevTranslatedWorldToCameraView;
  Result.PrevCameraViewToTranslatedWorld = View_PrevCameraViewToTranslatedWorld;
  Result.PrevTranslatedWorldCameraOrigin = View_PrevTranslatedWorldCameraOrigin;
  Result.PrevRelativeWorldCameraOrigin = View_PrevRelativeWorldCameraOrigin;
  Result.PrevRelativeWorldViewOrigin = View_PrevRelativeWorldViewOrigin;
  Result.RelativePrevPreViewTranslation = View_RelativePrevPreViewTranslation;
  Result.PrevClipToRelativeWorld = View_PrevClipToRelativeWorld;
  Result.PrevScreenToTranslatedWorld = View_PrevScreenToTranslatedWorld;
  Result.ClipToPrevClip = View_ClipToPrevClip;
  Result.ClipToPrevClipWithAA = View_ClipToPrevClipWithAA;
  Result.TemporalAAJitter = View_TemporalAAJitter;
  Result.GlobalClippingPlane = View_GlobalClippingPlane;
  Result.FieldOfViewWideAngles = View_FieldOfViewWideAngles;
  Result.PrevFieldOfViewWideAngles = View_PrevFieldOfViewWideAngles;
  Result.ViewRectMin = View_ViewRectMin;
  Result.ViewSizeAndInvSize = View_ViewSizeAndInvSize;
  Result.ViewRectMinAndSize = View_ViewRectMinAndSize;
  Result.LightProbeSizeRatioAndInvSizeRatio = View_LightProbeSizeRatioAndInvSizeRatio;
  Result.BufferSizeAndInvSize = View_BufferSizeAndInvSize;
  Result.BufferBilinearUVMinMax = View_BufferBilinearUVMinMax;
  Result.ScreenToViewSpace = View_ScreenToViewSpace;
  Result.BufferToSceneTextureScale = View_BufferToSceneTextureScale;
  Result.ResolutionFractionAndInv = View_ResolutionFractionAndInv;
  Result.NumSceneColorMSAASamples = View_NumSceneColorMSAASamples;
  Result.ProjectionDepthThicknessScale = View_ProjectionDepthThicknessScale;
  Result.PreExposure = View_PreExposure;
  Result.OneOverPreExposure = View_OneOverPreExposure;
  Result.DiffuseOverrideParameter = View_DiffuseOverrideParameter;
  Result.SpecularOverrideParameter = View_SpecularOverrideParameter;
  Result.NormalOverrideParameter = View_NormalOverrideParameter;
  Result.RoughnessOverrideParameter = View_RoughnessOverrideParameter;
  Result.PrevFrameGameTime = View_PrevFrameGameTime;
  Result.PrevFrameRealTime = View_PrevFrameRealTime;
  Result.OutOfBoundsMask = View_OutOfBoundsMask;
  Result.WorldCameraMovementSinceLastFrame = View_WorldCameraMovementSinceLastFrame;
  Result.CullingSign = View_CullingSign;
  Result.NearPlane = View_NearPlane;
  Result.GameTime = View_GameTime;
  Result.RealTime = View_RealTime;
  Result.DeltaTime = View_DeltaTime;
  Result.MaterialTextureMipBias = View_MaterialTextureMipBias;
  Result.MaterialTextureDerivativeMultiply = View_MaterialTextureDerivativeMultiply;
  Result.Random = View_Random;
  Result.FrameNumber = View_FrameNumber;
  Result.FrameCounter = View_FrameCounter;
  Result.StateFrameIndexMod8 = View_StateFrameIndexMod8;
  Result.StateFrameIndex = View_StateFrameIndex;
  Result.DebugViewModeMask = View_DebugViewModeMask;
  Result.WorldIsPaused = View_WorldIsPaused;
  Result.CameraCut = View_CameraCut;
  Result.UnlitViewmodeMask = View_UnlitViewmodeMask;
  Result.DirectionalLightColor = View_DirectionalLightColor;
  Result.DirectionalLightDirection = View_DirectionalLightDirection;
  Result.TranslucencyLightingVolumeMin = View_TranslucencyLightingVolumeMin;
  Result.TranslucencyLightingVolumeInvSize = View_TranslucencyLightingVolumeInvSize;
  Result.TemporalAAParams = View_TemporalAAParams;
  Result.CircleDOFParams = View_CircleDOFParams;
  Result.DepthOfFieldSensorWidth = View_DepthOfFieldSensorWidth;
  Result.DepthOfFieldFocalDistance = View_DepthOfFieldFocalDistance;
  Result.DepthOfFieldScale = View_DepthOfFieldScale;
  Result.DepthOfFieldFocalLength = View_DepthOfFieldFocalLength;
  Result.DepthOfFieldFocalRegion = View_DepthOfFieldFocalRegion;
  Result.DepthOfFieldNearTransitionRegion = View_DepthOfFieldNearTransitionRegion;
  Result.DepthOfFieldFarTransitionRegion = View_DepthOfFieldFarTransitionRegion;
  Result.MotionBlurNormalizedToPixel = View_MotionBlurNormalizedToPixel;
  Result.GeneralPurposeTweak = View_GeneralPurposeTweak;
  Result.GeneralPurposeTweak2 = View_GeneralPurposeTweak2;
  Result.DemosaicVposOffset = View_DemosaicVposOffset;
  Result.DecalDepthBias = View_DecalDepthBias;
  Result.IndirectLightingColorScale = View_IndirectLightingColorScale;
  Result.PrecomputedIndirectLightingColorScale = View_PrecomputedIndirectLightingColorScale;
  Result.PrecomputedIndirectSpecularColorScale = View_PrecomputedIndirectSpecularColorScale;
  Result.AtmosphereLightDirection = View_AtmosphereLightDirection;
  Result.AtmosphereLightIlluminanceOnGroundPostTransmittance = View_AtmosphereLightIlluminanceOnGroundPostTransmittance;
  Result.AtmosphereLightIlluminanceOuterSpace = View_AtmosphereLightIlluminanceOuterSpace;
  Result.AtmosphereLightDiscLuminance = View_AtmosphereLightDiscLuminance;
  Result.AtmosphereLightDiscCosHalfApexAngle_PPTrans = View_AtmosphereLightDiscCosHalfApexAngle_PPTrans;
  Result.SkyViewLutSizeAndInvSize = View_SkyViewLutSizeAndInvSize;
  Result.SkyCameraTranslatedWorldOrigin = View_SkyCameraTranslatedWorldOrigin;
  Result.SkyPlanetTranslatedWorldCenterAndViewHeight = View_SkyPlanetTranslatedWorldCenterAndViewHeight;
  Result.SkyViewLutReferential = View_SkyViewLutReferential;
  Result.SkyAtmosphereSkyLuminanceFactor = View_SkyAtmosphereSkyLuminanceFactor;
  Result.SkyAtmospherePresentInScene = View_SkyAtmospherePresentInScene;
  Result.SkyAtmosphereHeightFogContribution = View_SkyAtmosphereHeightFogContribution;
  Result.SkyAtmosphereBottomRadiusKm = View_SkyAtmosphereBottomRadiusKm;
  Result.SkyAtmosphereTopRadiusKm = View_SkyAtmosphereTopRadiusKm;
  Result.SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize = View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
  Result.SkyAtmosphereAerialPerspectiveStartDepthKm = View_SkyAtmosphereAerialPerspectiveStartDepthKm;
  Result.SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution = View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
  Result.SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv = View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
  Result.SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm = View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm;
  Result.SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv = View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
  Result.SkyAtmosphereApplyCameraAerialPerspectiveVolume = View_SkyAtmosphereApplyCameraAerialPerspectiveVolume;
  Result.NormalCurvatureToRoughnessScaleBias = View_NormalCurvatureToRoughnessScaleBias;
  Result.RenderingReflectionCaptureMask = View_RenderingReflectionCaptureMask;
  Result.RealTimeReflectionCapture = View_RealTimeReflectionCapture;
  Result.RealTimeReflectionCapturePreExposure = View_RealTimeReflectionCapturePreExposure;
  Result.AmbientCubemapTint = View_AmbientCubemapTint;
  Result.AmbientCubemapIntensity = View_AmbientCubemapIntensity;
  Result.SkyLightApplyPrecomputedBentNormalShadowingFlag = View_SkyLightApplyPrecomputedBentNormalShadowingFlag;
  Result.SkyLightAffectReflectionFlag = View_SkyLightAffectReflectionFlag;
  Result.SkyLightAffectGlobalIlluminationFlag = View_SkyLightAffectGlobalIlluminationFlag;
  Result.SkyLightColor = View_SkyLightColor;
  Result.MobileSkyIrradianceEnvironmentMap = View_MobileSkyIrradianceEnvironmentMap;
  Result.MobilePreviewMode = View_MobilePreviewMode;
  Result.HMDEyePaddingOffset = View_HMDEyePaddingOffset;
  Result.ReflectionCubemapMaxMip = View_ReflectionCubemapMaxMip;
  Result.ShowDecalsMask = View_ShowDecalsMask;
  Result.DistanceFieldAOSpecularOcclusionMode = View_DistanceFieldAOSpecularOcclusionMode;
  Result.IndirectCapsuleSelfShadowingIntensity = View_IndirectCapsuleSelfShadowingIntensity;
  Result.ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight = View_ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
  Result.StereoPassIndex = View_StereoPassIndex;
  Result.GlobalVolumeTranslatedCenterAndExtent = View_GlobalVolumeTranslatedCenterAndExtent;
  Result.GlobalVolumeTranslatedWorldToUVAddAndMul = View_GlobalVolumeTranslatedWorldToUVAddAndMul;
  Result.GlobalDistanceFieldMipTranslatedWorldToUVScale = View_GlobalDistanceFieldMipTranslatedWorldToUVScale;
  Result.GlobalDistanceFieldMipTranslatedWorldToUVBias = View_GlobalDistanceFieldMipTranslatedWorldToUVBias;
  Result.GlobalDistanceFieldMipFactor = View_GlobalDistanceFieldMipFactor;
  Result.GlobalDistanceFieldMipTransition = View_GlobalDistanceFieldMipTransition;
  Result.GlobalDistanceFieldClipmapSizeInPages = View_GlobalDistanceFieldClipmapSizeInPages;
  Result.GlobalDistanceFieldInvPageAtlasSize = View_GlobalDistanceFieldInvPageAtlasSize;
  Result.GlobalDistanceFieldInvCoverageAtlasSize = View_GlobalDistanceFieldInvCoverageAtlasSize;
  Result.GlobalVolumeDimension = View_GlobalVolumeDimension;
  Result.GlobalVolumeTexelSize = View_GlobalVolumeTexelSize;
  Result.MaxGlobalDFAOConeDistance = View_MaxGlobalDFAOConeDistance;
  Result.NumGlobalSDFClipmaps = View_NumGlobalSDFClipmaps;
  Result.CoveredExpandSurfaceScale = View_CoveredExpandSurfaceScale;
  Result.NotCoveredExpandSurfaceScale = View_NotCoveredExpandSurfaceScale;
  Result.NotCoveredMinStepScale = View_NotCoveredMinStepScale;
  Result.DitheredTransparencyStepThreshold = View_DitheredTransparencyStepThreshold;
  Result.DitheredTransparencyTraceThreshold = View_DitheredTransparencyTraceThreshold;
  Result.CursorPosition = View_CursorPosition;
  Result.bCheckerboardSubsurfaceProfileRendering = View_bCheckerboardSubsurfaceProfileRendering;
  Result.VolumetricFogInvGridSize = View_VolumetricFogInvGridSize;
  Result.VolumetricFogGridZParams = View_VolumetricFogGridZParams;
  Result.VolumetricFogSVPosToVolumeUV = View_VolumetricFogSVPosToVolumeUV;
  Result.VolumetricFogViewGridUVToPrevViewRectUV = View_VolumetricFogViewGridUVToPrevViewRectUV;
  Result.VolumetricFogPrevViewGridRectUVToResourceUV = View_VolumetricFogPrevViewGridRectUVToResourceUV;
  Result.VolumetricFogPrevUVMax = View_VolumetricFogPrevUVMax;
  Result.VolumetricFogScreenToResourceUV = View_VolumetricFogScreenToResourceUV;
  Result.VolumetricFogUVMax = View_VolumetricFogUVMax;
  Result.VolumetricFogMaxDistance = View_VolumetricFogMaxDistance;
  Result.VolumetricLightmapWorldToUVScale = View_VolumetricLightmapWorldToUVScale;
  Result.VolumetricLightmapWorldToUVAdd = View_VolumetricLightmapWorldToUVAdd;
  Result.VolumetricLightmapIndirectionTextureSize = View_VolumetricLightmapIndirectionTextureSize;
  Result.VolumetricLightmapBrickSize = View_VolumetricLightmapBrickSize;
  Result.VolumetricLightmapBrickTexelSize = View_VolumetricLightmapBrickTexelSize;
  Result.IndirectLightingCacheShowFlag = View_IndirectLightingCacheShowFlag;
  Result.EyeToPixelSpreadAngle = View_EyeToPixelSpreadAngle;
  Result.XRPassthroughCameraUVs = View_XRPassthroughCameraUVs;
  Result.GlobalVirtualTextureMipBias = View_GlobalVirtualTextureMipBias;
  Result.VirtualTextureFeedbackShift = View_VirtualTextureFeedbackShift;
  Result.VirtualTextureFeedbackMask = View_VirtualTextureFeedbackMask;
  Result.VirtualTextureFeedbackStride = View_VirtualTextureFeedbackStride;
  Result.VirtualTextureFeedbackJitterOffset = View_VirtualTextureFeedbackJitterOffset;
  Result.VirtualTextureFeedbackSampleOffset = View_VirtualTextureFeedbackSampleOffset;
  Result.RuntimeVirtualTextureMipLevel = View_RuntimeVirtualTextureMipLevel;
  Result.RuntimeVirtualTexturePackHeight = View_RuntimeVirtualTexturePackHeight;
  Result.RuntimeVirtualTextureDebugParams = View_RuntimeVirtualTextureDebugParams;
  Result.OverrideLandscapeLOD = View_OverrideLandscapeLOD;
  Result.FarShadowStaticMeshLODBias = View_FarShadowStaticMeshLODBias;
  Result.MinRoughness = View_MinRoughness;
  Result.HairRenderInfo = View_HairRenderInfo;
  Result.EnableSkyLight = View_EnableSkyLight;
  Result.HairRenderInfoBits = View_HairRenderInfoBits;
  Result.HairComponents = View_HairComponents;
  Result.bSubsurfacePostprocessEnabled = View_bSubsurfacePostprocessEnabled;
  Result.SSProfilesTextureSizeAndInvSize = View_SSProfilesTextureSizeAndInvSize;
  Result.SSProfilesPreIntegratedTextureSizeAndInvSize = View_SSProfilesPreIntegratedTextureSizeAndInvSize;
  Result.SpecularProfileTextureSizeAndInvSize = View_SpecularProfileTextureSizeAndInvSize;
  Result.PhysicsFieldClipmapCenter = View_PhysicsFieldClipmapCenter;
  Result.PhysicsFieldClipmapDistance = View_PhysicsFieldClipmapDistance;
  Result.PhysicsFieldClipmapResolution = View_PhysicsFieldClipmapResolution;
  Result.PhysicsFieldClipmapExponent = View_PhysicsFieldClipmapExponent;
  Result.PhysicsFieldClipmapCount = View_PhysicsFieldClipmapCount;
  Result.PhysicsFieldTargetCount = View_PhysicsFieldTargetCount;
  Result.PhysicsFieldTargets = View_PhysicsFieldTargets;
  Result.GPUSceneViewId = View_GPUSceneViewId;
  Result.ViewResolutionFraction = View_ViewResolutionFraction;
  Result.SubSurfaceColorAsTransmittanceAtDistanceInMeters = View_SubSurfaceColorAsTransmittanceAtDistanceInMeters;
  Result.TanAndInvTanHalfFOV = View_TanAndInvTanHalfFOV;
  Result.PrevTanAndInvTanHalfFOV = View_PrevTanAndInvTanHalfFOV;
  Result.GlintLUTParameters0 = View_GlintLUTParameters0;
  Result.GlintLUTParameters1 = View_GlintLUTParameters1;
  FinalizeViewState(Result);
  return Result;
}


#line 17 "/Engine/Private/InstancedStereo.ush"
void FinalizeViewState(inout ViewState InOutView) {
  InOutView.WorldToClip = MakeLWCInverseMatrix(InOutView.MatrixTilePosition, InOutView.RelativeWorldToClip);
  InOutView.ClipToWorld = MakeLWCMatrix(InOutView.MatrixTilePosition, InOutView.ClipToRelativeWorld);
  InOutView.ScreenToWorld = MakeLWCMatrix(InOutView.MatrixTilePosition, InOutView.ScreenToRelativeWorld);
  InOutView.PrevClipToWorld = MakeLWCMatrix(InOutView.MatrixTilePosition, InOutView.PrevClipToRelativeWorld);
  InOutView.WorldCameraOrigin = MakeLWCVector3(InOutView.ViewTilePosition, InOutView.RelativeWorldCameraOrigin);
  InOutView.WorldViewOrigin = MakeLWCVector3(InOutView.ViewTilePosition, InOutView.RelativeWorldViewOrigin);
  InOutView.PrevWorldCameraOrigin = MakeLWCVector3(InOutView.ViewTilePosition, InOutView.PrevRelativeWorldCameraOrigin);
  InOutView.PrevWorldViewOrigin = MakeLWCVector3(InOutView.ViewTilePosition, InOutView.PrevRelativeWorldViewOrigin);
  InOutView.PreViewTranslation = MakeLWCVector3(-InOutView.ViewTilePosition, InOutView.RelativePreViewTranslation);
  InOutView.PrevPreViewTranslation = MakeLWCVector3(-InOutView.ViewTilePosition, InOutView.RelativePrevPreViewTranslation);
}


#line 34 "/Engine/Private/InstancedStereo.ush"
static ViewState ResolvedView = (ViewState)0.F;
#line 36 "/Engine/Private/InstancedStereo.ush"
ViewState ResolveView() {
  return GetPrimaryView();
}


#line 71 "/Engine/Private/InstancedStereo.ush"
uint GetInstanceId(uint InstanceId) {
  return InstanceId;
}


#line 256 "/Engine/Private/Common.ush"
static float GlobalTextureMipBias = 0;
#line 257 "/Engine/Private/Common.ush"
static float GlobalRayCone_TexArea = 0;
#line 337 "/Engine/Private/Common.ush"
float4 Texture2DSampleLevel(Texture2D<vector<float, 4> > Tex, SamplerState Sampler, float2 UV, float Mip) {
  return Tex.SampleLevel(Sampler, UV, Mip);
}


#line 353 "/Engine/Private/Common.ush"
float4 Texture3DSampleLevel(Texture3D<vector<float, 4> > Tex, SamplerState Sampler, float3 UV, float Mip) {
  return Tex.SampleLevel(Sampler, UV, Mip);
}


#line 369 "/Engine/Private/Common.ush"
float4 TextureCubeSampleLevel(TextureCube<vector<float, 4> > Tex, SamplerState Sampler, float3 UV, float Mip) {
  return Tex.SampleLevel(Sampler, UV, Mip);
}


#line 924 "/Engine/Private/Common.ush"
float Pow2(float x) {
  return x * x;
}


#line 1711 "/Engine/Private/Common.ush"
struct FScreenVertexOutput {
  noperspective float2 UV : TEXCOORD0;
  float4 Position : SV_POSITION;
};
#line 1831 "/Engine/Private/Common.ush"
struct FWriteToSliceGeometryOutput {
  FScreenVertexOutput Vertex;
  uint LayerIndex : SV_RenderTargetArrayIndex;
};
#line 2050 "/Engine/Private/Common.ush"
struct FPixelShaderIn {
  float4 SvPosition;
  uint Coverage;
  bool bIsFrontFace;
};
#line 2062 "/Engine/Private/Common.ush"
struct FPixelShaderOut {
  float4 MRT[8];
  uint StrataOutput[3];
  uint StrataTopLayerData;
  uint Coverage;
  float Depth;
};
#line 104 "/Engine/Private/DistanceField/GlobalDistanceFieldShared.ush"
struct FGlobalDistanceFieldPage {
  uint PageIndex;
  bool bValid;
  bool bCoverage;
};
#line 88 "/Engine/Private/SceneData.ush"
static const uint InstanceTransformSizeFloat4Count = 3U;
#line 93 "/Engine/Private/SceneData.ush"
struct FPrimitiveSceneData {
  uint Flags;
  uint VisibilityFlags;
  int InstanceSceneDataOffset;
  int NumInstanceSceneDataEntries;
  int PersistentPrimitiveIndex;
  uint SingleCaptureIndex;
  float3 TilePosition;
  uint PrimitiveComponentId;
  FLWCMatrix LocalToWorld;
  FLWCInverseMatrix WorldToLocal;
  FLWCMatrix PreviousLocalToWorld;
  FLWCInverseMatrix PreviousWorldToLocal;
  float4x4 WorldToPreviousWorld;
  float3 InvNonUniformScale;
  float ObjectBoundsX;
  FLWCVector3 ObjectWorldPosition;
  FLWCVector3 ActorWorldPosition;
  float ObjectRadius;
  uint LightmapUVIndex;
  float3 ObjectOrientation;
  uint LightmapDataIndex;
  float4 NonUniformScale;
  float3 PreSkinnedLocalBoundsMin;
  uint NaniteResourceID;
  float3 PreSkinnedLocalBoundsMax;
  uint NaniteHierarchyOffset;
  float3 LocalObjectBoundsMin;
  float ObjectBoundsY;
  float3 LocalObjectBoundsMax;
  float ObjectBoundsZ;
  uint InstancePayloadDataOffset;
  uint InstancePayloadDataStride;
  uint InstancePayloadExtensionSize;
  float3 InstanceLocalBoundsCenter;
  float3 InstanceLocalBoundsExtent;
  float3 WireframeColor;
  float3 LevelColor;
  uint PackedNaniteFlags;
  float2 InstanceDrawDistanceMinMaxSquared;
  float InstanceWPODisableDistanceSquared;
  uint NaniteRayTracingDataOffset;
  float MaxWPOExtent;
  float MinMaterialDisplacement;
  float MaxMaterialDisplacement;
  uint CustomStencilValueAndMask;
  float4 CustomPrimitiveData[9];
};
#line 144 "/Engine/Private/SceneData.ush"
FPrimitiveSceneData GetPrimitiveDataFromUniformBuffer() {
  FPrimitiveSceneData PrimitiveData;
  PrimitiveData.Flags = Primitive_Flags;
  PrimitiveData.VisibilityFlags = Primitive_VisibilityFlags;
  PrimitiveData.InstanceSceneDataOffset = Primitive_InstanceSceneDataOffset;
  PrimitiveData.NumInstanceSceneDataEntries = Primitive_NumInstanceSceneDataEntries;
  PrimitiveData.SingleCaptureIndex = Primitive_SingleCaptureIndex;
  PrimitiveData.TilePosition = Primitive_TilePosition;
  PrimitiveData.PrimitiveComponentId = Primitive_PrimitiveComponentId;
  PrimitiveData.LocalToWorld = MakeLWCMatrix4x3(Primitive_TilePosition, Primitive_LocalToRelativeWorld);
  PrimitiveData.WorldToLocal = MakeLWCInverseMatrix4x3(Primitive_TilePosition, Primitive_RelativeWorldToLocal);
  PrimitiveData.PreviousLocalToWorld = MakeLWCMatrix4x3(Primitive_TilePosition, Primitive_PreviousLocalToRelativeWorld);
  PrimitiveData.PreviousWorldToLocal = MakeLWCInverseMatrix4x3(Primitive_TilePosition, Primitive_PreviousRelativeWorldToLocal);
  PrimitiveData.WorldToPreviousWorld = Primitive_WorldToPreviousWorld;
  PrimitiveData.InvNonUniformScale = Primitive_InvNonUniformScale;
  PrimitiveData.ObjectBoundsX = Primitive_ObjectBoundsX;
  PrimitiveData.ObjectWorldPosition = MakeLWCVector3(Primitive_TilePosition, Primitive_ObjectRelativeWorldPositionAndRadius.xyz);
  PrimitiveData.ObjectRadius = Primitive_ObjectRelativeWorldPositionAndRadius.w;
  PrimitiveData.ActorWorldPosition = MakeLWCVector3(Primitive_TilePosition, Primitive_ActorRelativeWorldPosition);
  PrimitiveData.LightmapUVIndex = Primitive_LightmapUVIndex;
  PrimitiveData.ObjectOrientation = Primitive_ObjectOrientation;
  PrimitiveData.LightmapDataIndex = Primitive_LightmapDataIndex;
  PrimitiveData.NonUniformScale = Primitive_NonUniformScale;
  PrimitiveData.PreSkinnedLocalBoundsMin = Primitive_PreSkinnedLocalBoundsMin;
  PrimitiveData.NaniteResourceID = Primitive_NaniteResourceID;
  PrimitiveData.PreSkinnedLocalBoundsMax = Primitive_PreSkinnedLocalBoundsMax;
  PrimitiveData.NaniteHierarchyOffset = Primitive_NaniteHierarchyOffset;
  PrimitiveData.LocalObjectBoundsMin = Primitive_LocalObjectBoundsMin;
  PrimitiveData.ObjectBoundsY = Primitive_ObjectBoundsY;
  PrimitiveData.LocalObjectBoundsMax = Primitive_LocalObjectBoundsMax;
  PrimitiveData.ObjectBoundsZ = Primitive_ObjectBoundsZ;
  PrimitiveData.InstancePayloadDataOffset = Primitive_InstancePayloadDataOffset;
  PrimitiveData.InstancePayloadDataStride = Primitive_InstancePayloadDataStride;
  PrimitiveData.InstancePayloadExtensionSize = Primitive_InstancePayloadExtensionSize;
  PrimitiveData.InstanceLocalBoundsCenter = Primitive_InstanceLocalBoundsCenter;
  PrimitiveData.InstanceLocalBoundsExtent = Primitive_InstanceLocalBoundsExtent;
  PrimitiveData.WireframeColor = Primitive_WireframeColor;
  PrimitiveData.LevelColor = Primitive_LevelColor;
  PrimitiveData.PackedNaniteFlags = Primitive_PackedNaniteFlags;
  PrimitiveData.InstanceDrawDistanceMinMaxSquared = Primitive_InstanceDrawDistanceMinMaxSquared;
  PrimitiveData.InstanceWPODisableDistanceSquared = Primitive_InstanceWPODisableDistanceSquared;
  PrimitiveData.PersistentPrimitiveIndex = Primitive_PersistentPrimitiveIndex;
  PrimitiveData.NaniteRayTracingDataOffset = Primitive_NaniteRayTracingDataOffset;
  PrimitiveData.MaxWPOExtent = Primitive_MaxWPOExtent;
  PrimitiveData.MinMaterialDisplacement = Primitive_MinMaterialDisplacement;
  PrimitiveData.MaxMaterialDisplacement = Primitive_MaxMaterialDisplacement;
  PrimitiveData.CustomStencilValueAndMask = Primitive_CustomStencilValueAndMask;
  [unroll]
  for (int DataIndex = 0; DataIndex < 9; ++DataIndex) {
    PrimitiveData.CustomPrimitiveData[DataIndex] = Primitive_CustomPrimitiveData[DataIndex];
  }
  return PrimitiveData;
}


#line 346 "/Engine/Private/SceneData.ush"
float GetPrimitive_DeterminantSign_FromFlags(uint Flags) {
  return CondMask(Flags & 64, -1.F, 1.F);
}


#line 404 "/Engine/Private/SceneData.ush"
struct FInstanceSceneEditorData {
  float3 HitProxyId;
  uint HitProxyPacked;
  bool bIsSelected;
};
#line 423 "/Engine/Private/SceneData.ush"
struct FInstancePayloadDataOffsets {
  uint HierarchyOffset;
  uint EditorData;
  uint LocalBounds;
  uint DynamicData;
  uint LightShadowUVBias;
  uint PayloadExtension;
  uint CustomData;
};
#line 434 "/Engine/Private/SceneData.ush"
struct FInstanceSceneData {
  FLWCMatrix LocalToWorld;
  FLWCMatrix PrevLocalToWorld;
  FLWCInverseMatrix WorldToLocal;
  float4 NonUniformScale;
  float3 InvNonUniformScale;
  float DeterminantSign;
  float3 LocalBoundsCenter;
  uint PrimitiveId;
  uint RelativeId;
  uint PayloadDataOffset;
  uint PayloadExtensionOffset;
  uint PayloadExtensionSize;
  float3 LocalBoundsExtent;
  uint LastUpdateSceneFrameNumber;
  uint NaniteRuntimeResourceID;
  uint NaniteHierarchyOffset;
  float4 LightMapAndShadowMapUVBias;
  bool ValidInstance;
  uint Flags;
  FInstanceSceneEditorData EditorData;
};
#line 1068 "/Engine/Private/SceneData.ush"
struct FSceneDataIntermediates {
  uint PrimitiveId;
  uint InstanceId;
  uint ViewIndex;
  uint CullingFlags;
  uint InstanceIdLoadIndex;
  FInstanceSceneData InstanceData;
  FPrimitiveSceneData Primitive;
};
#line 1242 "/Engine/Private/SceneData.ush"
FSceneDataIntermediates GetSceneDataIntermediates() {
  FSceneDataIntermediates Intermediates = (FSceneDataIntermediates)0;
  Intermediates.ViewIndex = 0U;
  Intermediates.PrimitiveId = 0U;
  Intermediates.InstanceId = 0U;
  Intermediates.Primitive = GetPrimitiveDataFromUniformBuffer();
  Intermediates.InstanceData.LocalToWorld = Intermediates.Primitive.LocalToWorld;
  Intermediates.InstanceData.PrevLocalToWorld = Intermediates.Primitive.PreviousLocalToWorld;
  Intermediates.InstanceData.WorldToLocal = Intermediates.Primitive.WorldToLocal;
  Intermediates.InstanceData.NonUniformScale = Intermediates.Primitive.NonUniformScale;
  Intermediates.InstanceData.InvNonUniformScale = Intermediates.Primitive.InvNonUniformScale;
  Intermediates.InstanceData.DeterminantSign = GetPrimitive_DeterminantSign_FromFlags(Intermediates.Primitive.Flags);
  Intermediates.InstanceData.LocalBoundsCenter = (Intermediates.Primitive.LocalObjectBoundsMax + Intermediates.Primitive.LocalObjectBoundsMin) * 0.5F;
  Intermediates.InstanceData.LocalBoundsExtent = (Intermediates.Primitive.LocalObjectBoundsMax - Intermediates.Primitive.LocalObjectBoundsMin) * 0.5F;
  Intermediates.InstanceData.ValidInstance = true;
  Intermediates.CullingFlags = ((1U << 0U));
  return Intermediates;
}


#line 20 "/Engine/Private/HairShadingCommon.ush"
struct FHairTransmittanceData {
  bool bUseLegacyAbsorption;
  bool bUseSeparableR;
  bool bUseBacklit;
  float OpaqueVisibility;
  float3 LocalScattering;
  float3 GlobalScattering;
  uint ScatteringComponent;
};
#line 12 "/Engine/Private/HairStrands/HairStrandsPack.ush"
struct FHairControlPoint {
  float3 Position;
  float WorldRadius;
  float UCoord;
  uint Type;
};
#line 172 "/Engine/Private/HairStrands/HairStrandsPack.ush"
struct FGuideData {
  uint3 VertexIndices;
  float3 VertexLerps;
  float3 VertexWeights;
};
#line 209 "/Engine/Private/HairStrands/HairStrandsPack.ush"
struct FHairCurve {
  uint PointIndex;
  uint PointCount;
};
#line 282 "/Engine/Private/HairStrands/HairStrandsPack.ush"
struct FHairTriangleIndex {
  uint TriangleIndex;
  uint SectionIndex;
};
#line 185 "/Engine/Private/ShadingCommon.ush"
struct FVerticalLayeringInfo {
  float TransmittanceTopAndBottom;
  float TransmittanceOnlyBottom;
  float TransmittanceOnlyTop;
  float SurfaceBottom;
  float SurfaceTop;
  float Coverage;
  float NoSurface;
};
#line 24 "/Engine/Private/LightAccumulator.ush"
struct FLightAccumulator {
  float3 TotalLight;
  float ScatterableLightLuma;
  float3 ScatterableLight;
  float EstimatedCost;
  float3 TotalLightDiffuse;
  float3 TotalLightSpecular;
};
#line 49 "/Engine/Private/LightAccumulator.ush"
struct FDeferredLightingSplit {
  float4 DiffuseLighting;
  float4 SpecularLighting;
};
#line 164 "/Engine/Private/LightAccumulator.ush"
struct FStrataDeferredLighting {
  float4 SceneColor;
};
#line 329 "/Engine/Private/DeferredShadingCommon.ush"
struct FGBufferData {
  float3 WorldNormal;
  float3 WorldTangent;
  float3 DiffuseColor;
  float3 SpecularColor;
  float3 BaseColor;
  float Metallic;
  float Specular;
  float4 CustomData;
  float GenericAO;
  float IndirectIrradiance;
  float4 PrecomputedShadowFactors;
  float Roughness;
  float Anisotropy;
  float GBufferAO;
  uint DiffuseIndirectSampleOcclusion;
  uint ShadingModelID;
  uint SelectiveOutputMask;
  float PerObjectGBufferData;
  float CustomDepth;
  uint CustomStencil;
  float Depth;
  float4 Velocity;
  float3 StoredBaseColor;
  float StoredSpecular;
  float StoredMetallic;
  float Curvature;
};
#line 438 "/Engine/Private/DeferredShadingCommon.ush"
struct FScreenSpaceData {
  FGBufferData GBuffer;
  float AmbientOcclusion;
};
#line 44 "/Engine/Private/SparseVolumeTexture/SparseVolumeTextureCommon.ush"
struct FSparseVolumeTextureUniforms {
  float3 VolumePageResolution;
  float3 PageTableOffset;
  float3 TileDataTexelSize;
  int FrameIndex;
  int HighestMipLevel;
  int LowestResidentMipLevel;
};
#line 169 "/Engine/Generated/Material.ush"
struct FStrataData {
  uint Dummy;
};
#line 340 "/Engine/Private/DBufferDecalShared.ush"
struct FDBufferData {
  float3 PreMulColor;
  float ColorOpacity;
  float3 PreMulWorldNormal;
  float NormalOpacity;
  float PreMulRoughness;
  float PreMulMetallic;
  float PreMulSpecular;
  float RoughnessOpacity;
};
#line 186 "/Engine/Generated/Material.ush"
struct FMaterialParticleParameters {
  float RelativeTime;
  float MotionBlurFade;
  float Random;
  float4 Velocity;
  float4 Color;
  float4 TranslatedWorldPositionAndSize;
  float4 MacroUV;
  float4 DynamicParameter;
  FLWCMatrix ParticleToWorld;
  FLWCInverseMatrix WorldToParticle;
  float2 Size;
  float SpriteRotation;
};
#line 296 "/Engine/Generated/Material.ush"
struct FMaterialAttributes {
  float3 BaseColor;
  float Metallic;
  float Specular;
  float Roughness;
  float Anisotropy;
  float3 EmissiveColor;
  float Opacity;
  float OpacityMask;
  float3 Normal;
  float3 Tangent;
  float3 WorldPositionOffset;
  float Displacement;
  float3 SubsurfaceColor;
  float ClearCoat;
  float ClearCoatRoughness;
  float AmbientOcclusion;
  float3 Refraction;
  float PixelDepthOffset;
  uint ShadingModel;
  float SurfaceThickness;
  FStrataData FrontMaterial;
  float2 CustomizedUV0;
  float2 CustomizedUV1;
  float2 CustomizedUV2;
  float2 CustomizedUV3;
  float2 CustomizedUV4;
  float2 CustomizedUV5;
  float2 CustomizedUV6;
  float2 CustomizedUV7;
  float3 BentNormal;
  float3 ClearCoatBottomNormal;
  float3 CustomEyeTangent;
  float3 TransmittanceColor;
};
#line 373 "/Engine/Generated/Material.ush"
struct FPixelMaterialInputs {
  float3 EmissiveColor;
  float Opacity;
  float OpacityMask;
  float3 BaseColor;
  float Metallic;
  float Specular;
  float Roughness;
  float Anisotropy;
  float3 Normal;
  float3 Tangent;
  float4 Subsurface;
  float AmbientOcclusion;
  float3 Refraction;
  float PixelDepthOffset;
  uint ShadingModel;
  FStrataData FrontMaterial;
  float SurfaceThickness;
  float Displacement;
};
#line 411 "/Engine/Generated/Material.ush"
struct FMaterialPixelParameters {
  float2 TexCoords[1];
  float4 VertexColor;
  float3 WorldNormal;
  float3 WorldTangent;
  float3 ReflectionVector;
  float3 CameraVector;
  float3 LightVector;
  float4 SvPosition;
  float4 ScreenPosition;
  float2 ViewBufferUV;
  float UnMirrored;
  float TwoSidedSign;
  float3x3 TangentToWorld;
  FLWCVector3 AbsoluteWorldPosition;
  float3 WorldPosition_CamRelative;
  FLWCVector3 WorldPosition_NoOffsets;
  float3 WorldPosition_NoOffsets_CamRelative;
  float3 LightingPositionOffset;
  float3 WorldPosition_DDX;
  float3 WorldPosition_DDY;
  float4 VertexColor_DDX;
  float4 VertexColor_DDY;
  float4 ScreenPosition_DDX;
  float4 ScreenPosition_DDY;
  float2 TexCoords_DDX[1];
  float2 TexCoords_DDY[1];
  float AOMaterialMask;
  uint PrimitiveId;
  FMaterialParticleParameters Particle;
  FMaterialAttributes MaterialAttributes;
};
#line 651 "/Engine/Generated/Material.ush"
struct FMaterialVertexParameters {
  float3 WorldPosition;
  float3x3 TangentToWorld;
  FLWCMatrix PrevFrameLocalToWorld;
  float3 PreSkinnedPosition;
  float3 PreSkinnedNormal;
  float4 VertexColor;
  float2 TexCoords[1];
  FMaterialParticleParameters Particle;
  FMaterialAttributes MaterialAttributes;
  FSceneDataIntermediates SceneData;
  uint PrimitiveId;
  bool bEvaluateWorldPositionOffset;
};
#line 722 "/Engine/Generated/Material.ush"
FMaterialVertexParameters MakeInitializedMaterialVertexParameters() {
  FMaterialVertexParameters Result = (FMaterialVertexParameters)0;
  Result.PrimitiveId = ((1U << (20U)) - 1U);
  Result.bEvaluateWorldPositionOffset = true;
  return Result;
}


#line 751 "/Engine/Generated/Material.ush"
FPrimitiveSceneData GetPrimitiveData(FMaterialVertexParameters Parameters) {
  return Parameters.SceneData.Primitive;
}


#line 812 "/Engine/Generated/Material.ush"
float3x3 GetLocalToWorld3x3() {
  return LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().LocalToWorld);
}


#line 3160 "/Engine/Generated/Material.ush"
bool ShouldEnableWorldPositionOffset(FMaterialVertexParameters Parameters) {
  return false;
}


#line 3175 "/Engine/Generated/Material.ush"
float3 ClampWorldPositionOffset(FMaterialVertexParameters Parameters, float3 InOffset) {
  const float MaxWPODim = GetPrimitiveData(Parameters).MaxWPOExtent;
  return MaxWPODim <= 0.F ? InOffset : clamp(InOffset, -MaxWPODim.xxx, MaxWPODim.xxx);
}


#line 3186 "/Engine/Generated/Material.ush"
float3 GetMaterialWorldPositionOffsetRaw(FMaterialVertexParameters Parameters) {
  return float3(0., 0., 0.);
  ;
}


#line 3191 "/Engine/Generated/Material.ush"
float3 GetMaterialWorldPositionOffset(FMaterialVertexParameters Parameters) {
  [branch]
  if (ShouldEnableWorldPositionOffset(Parameters)) {
    return ClampWorldPositionOffset(Parameters, GetMaterialWorldPositionOffsetRaw(Parameters));
  }
  return float3(0, 0, 0);
}


#line 3249 "/Engine/Generated/Material.ush"
struct FMaterialRefractionData {
  float2 Data;
  float RefractionDepthBias;
};
#line 3291 "/Engine/Generated/Material.ush"
void GetMaterialCustomizedUVs(FMaterialVertexParameters Parameters, inout float2 OutTexCoords[1]) {
  float2 Local4 = Parameters.TexCoords[0].xy;
  OutTexCoords[0] = Local4;
}


#line 3298 "/Engine/Generated/Material.ush"
void GetCustomInterpolators(FMaterialVertexParameters Parameters, inout float2 OutTexCoords[1]) {
}


#line 67 "/Engine/Private/BasePassCommon.ush"
struct FSharedBasePassInterpolants {
  float4 VertexFog : TEXCOORD7;
  float3 PixelPositionExcludingWPO : TEXCOORD9;
};
#line 10 "/Engine/Private/SHCommon.ush"
struct FOneBandSHVector {
  float V;
};
#line 16 "/Engine/Private/SHCommon.ush"
struct FOneBandSHVectorRGB {
  FOneBandSHVector R;
  FOneBandSHVector G;
  FOneBandSHVector B;
};
#line 24 "/Engine/Private/SHCommon.ush"
struct FTwoBandSHVector {
  float4 V;
};
#line 30 "/Engine/Private/SHCommon.ush"
struct FTwoBandSHVectorRGB {
  FTwoBandSHVector R;
  FTwoBandSHVector G;
  FTwoBandSHVector B;
};
#line 38 "/Engine/Private/SHCommon.ush"
struct FThreeBandSHVector {
  float4 V0;
  float4 V1;
  float V2;
};
#line 45 "/Engine/Private/SHCommon.ush"
struct FThreeBandSHVectorRGB {
  FThreeBandSHVector R;
  FThreeBandSHVector G;
  FThreeBandSHVector B;
};
#line 7 "/Engine/Private/SphericalGaussian.ush"
struct FSphericalGaussian {
  float3 Axis;
  float Sharpness;
  float Amplitude;
};
#line 241 "/Engine/Private/SphericalGaussian.ush"
struct FAnisoSphericalGaussian {
  float3 AxisX;
  float3 AxisY;
  float3 AxisZ;
  float SharpnessX;
  float SharpnessY;
  float Amplitude;
};
#line 121 "/Engine/Private/BasePassCommon.ush"
struct FShadingOcclusion {
  float DiffOcclusion;
  float SpecOcclusion;
  float3 BentNormal;
};
#line 11 "/Plugin/FX/Niagara/Private/NiagaraVFParticleAccess.usf"
uint NiagaraGetFloatDataStride() {
  return NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride;
}


#line 49 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
bool NiagaraGetIsHalfAndFixupRegister(inout int RegisterIdx) {
  const uint HalfBit = (1 << 31);
  const bool bIsHalf = RegisterIdx & HalfBit;
  RegisterIdx &= ~HalfBit;
  return bIsHalf;
}


#line 62 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float NiagaraGetFloat_Internal(Buffer<float> FloatBuffer, int RegisterIdx, uint ParticleIdx) {
  return FloatBuffer[RegisterIdx * NiagaraGetFloatDataStride() + ParticleIdx];
}


#line 67 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float2 NiagaraGetVec2_Internal(Buffer<float> FloatBuffer, int RegisterIdx, uint ParticleIdx) {
  return float2(NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 0, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 1, ParticleIdx));
}


#line 73 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float3 NiagaraGetVec3_Internal(Buffer<float> FloatBuffer, int RegisterIdx, uint ParticleIdx) {
  return float3(NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 0, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 1, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 2, ParticleIdx));
}


#line 80 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float4 NiagaraGetVec4_Internal(Buffer<float> FloatBuffer, int RegisterIdx, uint ParticleIdx) {
  return float4(NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 0, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 1, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 2, ParticleIdx), NiagaraGetFloat_Internal(FloatBuffer, RegisterIdx + 3, ParticleIdx));
}


#line 88 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float NiagaraGetFloat(int RegisterIdx, uint ParticleIdx) {
  [branch]
  if (NiagaraGetIsHalfAndFixupRegister(RegisterIdx)) {
    return NiagaraGetFloat_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf), RegisterIdx, ParticleIdx);
  } else {
    return NiagaraGetFloat_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat), RegisterIdx, ParticleIdx);
  }
}


#line 101 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float2 NiagaraGetVec2(int RegisterIdx, uint ParticleIdx) {
  [branch]
  if (NiagaraGetIsHalfAndFixupRegister(RegisterIdx)) {
    return NiagaraGetVec2_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf), RegisterIdx, ParticleIdx);
  } else {
    return NiagaraGetVec2_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat), RegisterIdx, ParticleIdx);
  }
}


#line 114 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float3 NiagaraGetVec3(int RegisterIdx, uint ParticleIdx) {
  [branch]
  if (NiagaraGetIsHalfAndFixupRegister(RegisterIdx)) {
    return NiagaraGetVec3_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf), RegisterIdx, ParticleIdx);
  } else {
    return NiagaraGetVec3_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat), RegisterIdx, ParticleIdx);
  }
}


#line 127 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float4 NiagaraGetVec4(int RegisterIdx, uint ParticleIdx) {
  [branch]
  if (NiagaraGetIsHalfAndFixupRegister(RegisterIdx)) {
    return NiagaraGetVec4_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf), RegisterIdx, ParticleIdx);
  } else {
    return NiagaraGetVec4_Internal((NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat), RegisterIdx, ParticleIdx);
  }
}


#line 140 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float NiagaraSafeGetFloat(int RegisterIdx, uint ParticleIdx, float Default) {
  [branch]
  if (RegisterIdx == -1)
    return Default;
  return NiagaraGetFloat(RegisterIdx, ParticleIdx);
}


#line 149 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float2 NiagaraSafeGetVec2(int RegisterIdx, uint ParticleIdx, float2 Default) {
  [branch]
  if (RegisterIdx == -1)
    return Default;
  return NiagaraGetVec2(RegisterIdx, ParticleIdx);
}


#line 158 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float3 NiagaraSafeGetVec3(int RegisterIdx, uint ParticleIdx, float3 Default) {
  [branch]
  if (RegisterIdx == -1)
    return Default;
  return NiagaraGetVec3(RegisterIdx, ParticleIdx);
}


#line 167 "/Plugin/FX/Niagara/Private/NiagaraParticleAccess.ush"
float4 NiagaraSafeGetVec4(int RegisterIdx, uint ParticleIdx, float4 Default) {
  [branch]
  if (RegisterIdx == -1)
    return Default;
  return NiagaraGetVec4(RegisterIdx, ParticleIdx);
}


#line 21 "/Plugin/FX/Niagara/Private/NiagaraVFParticleAccess.usf"
float SafeGetFloat(int RegisterIdx, uint InstanceID, float Default) {
  return NiagaraSafeGetFloat(RegisterIdx, InstanceID, Default);
}


#line 22 "/Plugin/FX/Niagara/Private/NiagaraVFParticleAccess.usf"
float2 SafeGetVec2(int RegisterIdx, uint InstanceID, float2 Default) {
  return NiagaraSafeGetVec2(RegisterIdx, InstanceID, Default);
}


#line 23 "/Plugin/FX/Niagara/Private/NiagaraVFParticleAccess.usf"
float3 SafeGetVec3(int RegisterIdx, uint InstanceID, float3 Default) {
  return NiagaraSafeGetVec3(RegisterIdx, InstanceID, Default);
}


#line 24 "/Plugin/FX/Niagara/Private/NiagaraVFParticleAccess.usf"
float4 SafeGetVec4(int RegisterIdx, uint InstanceID, float4 Default) {
  return NiagaraSafeGetVec4(RegisterIdx, InstanceID, Default);
}


#line 39 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
struct FVertexFactoryInput {
  float2 TexCoord : ATTRIBUTE0;
  uint VertexId : SV_VertexID;
  uint InstanceId : SV_InstanceID;
};
#line 92 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
struct FVertexFactoryInterpolantsVSToPS {
  float4 TangentToWorld0AndInterp_Sizer : TEXCOORD10;
  float4 TangentToWorld2 : TEXCOORD11;
  float4 Color : TEXCOORD0;
  float4 TexCoords[1] : TEXCOORD1;
};
#line 163 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
struct FVertexFactoryIntermediates {
  FLWCVector3 VertexWorldPosition;
  FLWCVector3 PreviousVertexWorldPosition;
  float4 TranslatedWorldPositionAndSize;
  float4 TexCoord;
  float3 TangentUp;
  float3 TangentRight;
  float4 Color;
  float4 ParticleVelocity;
  float2 UVScale;
  FLWCVector3 Position;
  float2 Size;
  float3 CustomFacingVector;
  float3 CustomAlignmentVector;
  float SubImageLerp;
  float3x3 TangentToLocal;
  float2 ParticleSize;
  FSceneDataIntermediates SceneData;
};
#line 246 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
bool UVIndexUseZW(int UVIndex) {
  return (UVIndex % 2) != 0;
}


#line 257 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
void SetUV(inout FVertexFactoryInterpolantsVSToPS Interpolants, int UVIndex, float2 InValue) {
  [flatten]
  if (UVIndexUseZW(UVIndex)) {
    Interpolants.TexCoords[UVIndex / 2].zw = InValue;
  } else {
    Interpolants.TexCoords[UVIndex / 2].xy = InValue;
  }
}


#line 375 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FMaterialVertexParameters GetMaterialVertexParameters(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates, float3 WorldPosition, float3x3 TangentToLocal) {
  FMaterialVertexParameters Result = MakeInitializedMaterialVertexParameters();
  Result.SceneData = Intermediates.SceneData;
  Result.WorldPosition = WorldPosition;
  Result.VertexColor = Intermediates.Color;
  Result.TangentToWorld = mul(TangentToLocal, GetLocalToWorld3x3());
  Result.Particle.MacroUV = NiagaraSpriteVF_MacroUVParameters;
  Result.Particle.Color = Intermediates.Color;
  Result.Particle.MotionBlurFade = 1.F;
  Result.PreSkinnedPosition = LWCToFloat(Intermediates.Position);
  Result.PreSkinnedNormal = TangentToLocal[2].xyz;
  Result.PrevFrameLocalToWorld = LWCPromote(float4x4(float4(1.F, 0.F, 0.F, 0.F), float4(0.F, 1.F, 0.F, 0.F), float4(0.F, 0.F, 1.F, 0.F), float4(0.F, 0.F, 0.F, 1.F)));
  Result.Particle.SpriteRotation = 0.F;
  Result.Particle.Random = 0.F;
  Result.TexCoords[0] = Intermediates.TexCoord.xy;
  return Result;
}


#line 458 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 SafeNormalize(float3 V) {
  float L = length(V);
  return V = V / max(L, 9.9999999999999995E-7);
}


#line 467 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 SafeNormalizeWithFallback(float3 V, float3 Fallback) {
  float L = length(V);
  return L > 9.9999999999999995E-7 ? V / L : Fallback;
}


#line 473 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
void GetTangents(FVertexFactoryInput Input, FLWCVector3 ParticlePosition, float Rotation, float3 CustomFacing, float3 CustomAlignment, float3 ParticleDirection, out float3 OutRight, out float3 OutUp) {
  float3 ResolvedViewRight = lerp(ResolvedView.ViewRight, ResolvedView.HMDViewNoRollRight, NiagaraSpriteVF_RemoveHMDRoll);
  float3 ResolvedViewUp = lerp(ResolvedView.ViewUp, ResolvedView.HMDViewNoRollUp, NiagaraSpriteVF_RemoveHMDRoll);
  float3 CameraRight = ResolvedViewRight;
  float3 CameraUp = -ResolvedViewUp;
  float3 CameraFacingVector = -ResolvedView.ViewForward;
  const float3 CameraVector = LWCToFloat(LWCSubtract(ResolvedView.WorldCameraOrigin, ParticlePosition));
  const float3 CameraDirection = SafeNormalize(CameraVector);
  float3 CustomFacingVector = NiagaraSpriteVFLooseParameters_ParticleFacingMode == 2 ? CustomFacing : CameraDirection;
  float3 DirectionVector = lerp(ParticleDirection, CustomAlignment, NiagaraSpriteVFLooseParameters_ParticleAlignmentMode == 2);
  float3 CameraRightAligned = SafeNormalize(cross(CustomFacingVector, DirectionVector));
  float3 CameraUpAligned = lerp(-DirectionVector, cross(CustomFacingVector, CameraRightAligned), NiagaraSpriteVFLooseParameters_ParticleFacingMode == 2);
  float3 CameraRightPlaneFacing = SafeNormalize(cross(CameraFacingVector, ResolvedViewUp));
  float3 CameraUpPlaneFacing = cross(CameraFacingVector, CameraRightPlaneFacing);
  float3 CameraRightCustomFacing = SafeNormalize(cross(CustomFacingVector, ResolvedViewUp));
  float3 CameraUpCustomFacing = cross(CustomFacingVector, CameraRightCustomFacing);
  float3 CameraRightPosition = SafeNormalize(cross(CameraDirection, float3(0, 0, 1)));
  float3 CameraUpPosition = cross(CameraDirection, CameraRightPosition);
  float3 Right;
  float3 Up;
  [branch]
  if (NiagaraSpriteVFLooseParameters_ParticleAlignmentMode == 0) {
    [flatten]
    if (NiagaraSpriteVFLooseParameters_ParticleFacingMode == 4) {
      float CameraDistanceSq = dot(CameraVector, CameraVector);
      float Interp = saturate(CameraDistanceSq * NiagaraSpriteVF_CameraFacingBlend.y - NiagaraSpriteVF_CameraFacingBlend.z);
      Right = cross(CameraDirection, float3(0, 0, 1));
      Up = cross(CameraDirection, Right);
      Right = lerp(Right, CameraRight.xyz, Interp);
      Up = lerp(Up, CameraUp.xyz, Interp);
    } else if (NiagaraSpriteVFLooseParameters_ParticleFacingMode == 0) {
      Right = CameraRight.xyz;
      Up = CameraUp.xyz;
    } else if (NiagaraSpriteVFLooseParameters_ParticleFacingMode == 1) {
      Right = CameraRightPlaneFacing;
      Up = CameraUpPlaneFacing;
    } else if (NiagaraSpriteVFLooseParameters_ParticleFacingMode == 2) {
      Right = CameraRightCustomFacing;
      Up = CameraUpCustomFacing;
    } else {
      Right = CameraRightPosition;
      Up = CameraUpPosition;
    }
  } else {
    Right = CameraRightAligned;
    Up = CameraUpAligned;
  }
  float SinRotation;
  float CosRotation;
  sincos(Rotation, SinRotation, CosRotation);
  float3 SR = Right * SinRotation;
  float3 SU = Up * SinRotation;
  float3 CR = Right * CosRotation;
  float3 CU = Up * CosRotation;
  OutRight = SU + CR;
  OutUp = CU - SR;
}


#line 568 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3x3 CalcTangentBasis(FVertexFactoryIntermediates Intermediates) {
  float3x3 Result;
  const float2 UVSign = sign(Intermediates.UVScale);
  Result[0] = Intermediates.TangentRight * UVSign.x;
  Result[1] = Intermediates.TangentUp * UVSign.y;
  if (NiagaraSpriteVF_NormalsType < 0.5F) {
    Result[2] = normalize(cross(Result[0], Result[1]));
    if (UVSign.x != UVSign.y) {
      Result[2] *= -1.F;
    }
  } else if (NiagaraSpriteVF_NormalsType < 1.5F) {
    float3 TangentZ = normalize(LWCToFloat(LWCSubtract(Intermediates.Position, NiagaraSpriteVF_NormalsSphereCenter.xyz)));
    Result[2] = TangentZ;
  } else {
    float3 ClosestPointOnCylinder = NiagaraSpriteVF_NormalsSphereCenter.xyz + dot(NiagaraSpriteVF_NormalsCylinderUnitDirection.xyz, LWCToFloat(LWCSubtract(Intermediates.Position, NiagaraSpriteVF_NormalsSphereCenter.xyz))) * NiagaraSpriteVF_NormalsCylinderUnitDirection.xyz;
    float3 TangentZ = normalize(LWCToFloat(LWCSubtract(Intermediates.Position, ClosestPointOnCylinder)));
    Result[2] = TangentZ;
  }
  return Result;
}


#line 607 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
void ComputeBillboardUVs(FVertexFactoryInput Input, float2 ParticleSize, float SubImageIndex, out float2 UVForPosition, out float2 UVForTexturing, out float2 UVForTexturingUnflipped) {
  float2 UVFlip = sign(ParticleSize);
  [branch]
  if (NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame > 0) {
    const uint VertexIndexMask = NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame == 8 ? 7 : 3;
    uint CutoutVertexIndex = Input.VertexId & VertexIndexMask;
    float NumFrames = NiagaraSpriteVF_SubImageSize.x * NiagaraSpriteVF_SubImageSize.y;
    uint SubImageIndexInt = (uint)fmod(SubImageIndex, NumFrames);
    [flatten]
    if (UVFlip.x * UVFlip.y < 0) {
      CutoutVertexIndex = NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame - 1 - CutoutVertexIndex;
    }
    UVForTexturing = UVForTexturingUnflipped = NiagaraSpriteVFLooseParameters_CutoutGeometry[SubImageIndexInt * NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame + CutoutVertexIndex];
    UVForPosition.x = UVFlip.x < 0. ? 1. - UVForTexturing.x : UVForTexturing.x;
    UVForPosition.y = UVFlip.y < 0. ? 1. - UVForTexturing.y : UVForTexturing.y;
  } else {
    UVForTexturing.x = UVFlip.x < 0. ? 1. - Input.TexCoord.x : Input.TexCoord.x;
    UVForTexturing.y = UVFlip.y < 0. ? 1. - Input.TexCoord.y : Input.TexCoord.y;
    UVForPosition = UVForTexturingUnflipped = Input.TexCoord.xy;
  }
}


#line 648 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FLWCVector3 SimToWorldPos(float3 SimSpacePos, FLWCMatrix LocalToWorld) {
  if (NiagaraSpriteVF_bLocalSpace) {
    return LWCMultiply(SimSpacePos, LocalToWorld);
  }
  return MakeLWCVector3(NiagaraSpriteVF_SystemLWCTile, SimSpacePos);
}


#line 658 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 LocalToWorldVec(float3 LocalSpaceVec, float3x3 LocalToWorld) {
  const float3 InvScale = GetPrimitiveDataFromUniformBuffer().InvNonUniformScale;
  return InvScale.x * LocalToWorld[0] * LocalSpaceVec.xxx + InvScale.y * LocalToWorld[1] * LocalSpaceVec.yyy + InvScale.z * LocalToWorld[2] * LocalSpaceVec.zzz;
}


#line 667 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 SimToWorldVec(float3 SimSpaceVec, float3x3 LocalToWorld) {
  if (NiagaraSpriteVF_bLocalSpace) {
    return LocalToWorldVec(SimSpaceVec, LocalToWorld);
  }
  return SimSpaceVec;
}


#line 681 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FLWCVector3 GetNiagaraParticlePosition(uint InstanceID) {
  float3 ParticlePos = SafeGetVec3(NiagaraSpriteVF_PositionDataOffset, InstanceID, NiagaraSpriteVF_DefaultPos.xyz);
  return SimToWorldPos(ParticlePos, GetPrimitiveDataFromUniformBuffer().LocalToWorld);
}


#line 687 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FLWCVector3 GetNiagaraPreviousParticlePosition(uint InstanceID) {
  float3 PrevParticlePos = SafeGetVec3(NiagaraSpriteVF_PrevPositionDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevPos.xyz);
  return SimToWorldPos(PrevParticlePos, GetPrimitiveDataFromUniformBuffer().PreviousLocalToWorld);
}


#line 693 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraParticleVelocity(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_VelocityDataOffset, InstanceID, NiagaraSpriteVF_DefaultVelocity.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().LocalToWorld));
}


#line 698 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraPreviousParticleVelocity(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_PrevVelocityDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevVelocity.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().PreviousLocalToWorld));
}


#line 703 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float2 GetNiagaraParticleSize(uint InstanceID) {
  return SafeGetVec2(NiagaraSpriteVF_SizeDataOffset, InstanceID, NiagaraSpriteVF_DefaultSize.xy);
}


#line 708 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float2 GetNiagaraPreviousParticleSize(uint InstanceID) {
  return SafeGetVec2(NiagaraSpriteVF_PrevSizeDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevSize.xy);
}


#line 713 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float GetNiagaraParticleRotation(uint InstanceID) {
  const float Rotation = (SafeGetFloat(NiagaraSpriteVF_RotationDataOffset, InstanceID, NiagaraSpriteVF_DefaultRotation) / 180.F) * PI;
  return Rotation * NiagaraSpriteVF_RotationScale + NiagaraSpriteVF_RotationBias;
}


#line 720 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float GetNiagaraPreviousParticleRotation(uint InstanceID) {
  const float PrevRotation = (SafeGetFloat(NiagaraSpriteVF_PrevRotationDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevRotation) / 180.F) * PI;
  return PrevRotation * NiagaraSpriteVF_RotationScale + NiagaraSpriteVF_RotationBias;
}


#line 727 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float4 GetNiagaraParticleColor(uint InstanceID) {
  return SafeGetVec4(NiagaraSpriteVF_ColorDataOffset, InstanceID, NiagaraSpriteVF_DefaultColor);
}


#line 732 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float2 GetNiagaraUVScale(uint InstanceID) {
  return SafeGetVec2(NiagaraSpriteVF_UVScaleDataOffset, InstanceID, NiagaraSpriteVF_DefaultUVScale.xy);
}


#line 737 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float2 GetNiagaraPivotOffset(uint InstanceID) {
  return SafeGetVec2(NiagaraSpriteVF_PivotOffsetDataOffset, InstanceID, NiagaraSpriteVF_DefaultPivotOffset);
}


#line 742 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float2 GetNiagaraPreviousPivotOffset(uint InstanceID) {
  return SafeGetVec2(NiagaraSpriteVF_PrevPivotOffsetDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevPivotOffset);
}


#line 752 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float GetNiagaraCameraOffset(uint InstanceID) {
  return SafeGetFloat(NiagaraSpriteVF_CameraOffsetDataOffset, InstanceID, NiagaraSpriteVF_DefaultCamOffset);
}


#line 757 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float GetNiagaraPreviousCameraOffset(uint InstanceID) {
  return SafeGetFloat(NiagaraSpriteVF_PrevCameraOffsetDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevCamOffset);
}


#line 794 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float GetNiagaraParticleSubimage(uint InstanceID) {
  return SafeGetFloat(NiagaraSpriteVF_SubimageDataOffset, InstanceID, NiagaraSpriteVF_DefaultSubImage);
}


#line 800 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraParticleFacingVector(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_FacingDataOffset, InstanceID, NiagaraSpriteVF_DefaultFacing.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().LocalToWorld));
}


#line 806 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraPreviousParticleFacingVector(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_PrevFacingDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevFacing.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().PreviousLocalToWorld));
}


#line 812 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraParticleAlignmentVector(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_AlignmentDataOffset, InstanceID, NiagaraSpriteVF_DefaultAlignment.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().LocalToWorld));
}


#line 817 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3 GetNiagaraPreviousParticleAlignmentVector(uint InstanceID) {
  return SimToWorldVec(SafeGetVec3(NiagaraSpriteVF_PrevAlignmentDataOffset, InstanceID, NiagaraSpriteVF_DefaultPrevAlignment.xyz), LWCToFloat3x3(GetPrimitiveDataFromUniformBuffer().PreviousLocalToWorld));
}


#line 822 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FVertexFactoryIntermediates GetVertexFactoryIntermediates(FVertexFactoryInput Input) {
  FVertexFactoryIntermediates Intermediates = (FVertexFactoryIntermediates)0;
  uint ParticleID = GetInstanceId(Input.InstanceId);
  if (NiagaraSpriteVFLooseParameters_SortedIndicesOffset != 4294967295) {
    ParticleID = NiagaraSpriteVFLooseParameters_SortedIndices[NiagaraSpriteVFLooseParameters_SortedIndicesOffset + ParticleID];
  }
  const FLWCVector3 ParticlePosition = GetNiagaraParticlePosition(ParticleID);
  const float ParticleRotation = GetNiagaraParticleRotation(ParticleID);
  const float2 ParticleSize = GetNiagaraParticleSize(ParticleID);
  const float3 ParticleVelocity = GetNiagaraParticleVelocity(ParticleID);
  const float SubImageIndex = GetNiagaraParticleSubimage(ParticleID);
  const float3 CustomFacing = SafeNormalize(GetNiagaraParticleFacingVector(ParticleID));
  const float3 CustomAlignment = SafeNormalize(GetNiagaraParticleAlignmentVector(ParticleID));
  const float2 PivotOffset = GetNiagaraPivotOffset(ParticleID);
  const float2 UVScale = GetNiagaraUVScale(ParticleID);
  const float3 CameraOffset = SafeNormalize(LWCToFloat(LWCSubtract(ResolvedView.WorldCameraOrigin, ParticlePosition))) * GetNiagaraCameraOffset(ParticleID);
  Intermediates.SceneData = GetSceneDataIntermediates();
  Intermediates.Position = ParticlePosition;
  Intermediates.Size = ParticleSize;
  Intermediates.Color = GetNiagaraParticleColor(ParticleID);
  Intermediates.CustomFacingVector = CustomFacing;
  Intermediates.CustomAlignmentVector = SafeNormalize(GetNiagaraParticleAlignmentVector(ParticleID));
  Intermediates.UVScale = UVScale;
  {
    const float3 ParticleDirection = SafeNormalizeWithFallback(ParticleVelocity, float3(0, 0, 1));
    float3 Right, Up;
    GetTangents(Input, ParticlePosition, ParticleRotation, CustomFacing, CustomAlignment, ParticleDirection, Right, Up);
    Intermediates.TangentUp = Up;
    Intermediates.TangentRight = Right;
  }
  float2 UVForPosition;
  float2 UVForTexturing;
  float2 UVForTexturingUnflipped;
  ComputeBillboardUVs(Input, ParticleSize, SubImageIndex, UVForPosition, UVForTexturing, UVForTexturingUnflipped);
  UVForTexturing.xy = float2(0.5F, 0.5F) + (UVForTexturing.xy - float2(0.5F, 0.5F)) * UVScale.xy;
  const float2 Size = abs(Intermediates.Size.xy);
  float PixelSizeRatio = 1.F;
  if (NiagaraSpriteVF_PixelCoverageEnabled != 0) {
    const float Depth = dot(LWCToFloat(LWCSubtract(ParticlePosition, ResolvedView.WorldCameraOrigin)), ResolvedView.ViewForward);
    const float HalfSize = max(Size.x, Size.y) * 0.5F;
    const float PixelSize = max(View_ViewSizeAndInvSize.z * GetTanHalfFieldOfView().x * Depth * 2.F, HalfSize);
    PixelSizeRatio = PixelSize / HalfSize;
    float Coverage = saturate(HalfSize * 2.F / PixelSize);
    Coverage = Coverage * Coverage;
    Intermediates.Color = (Intermediates.Color * Coverage * NiagaraSpriteVF_PixelCoverageColorBlend) + (Intermediates.Color * (1 - NiagaraSpriteVF_PixelCoverageColorBlend));
  }
  const float2x3 Tangents = float2x3(Intermediates.TangentRight, Intermediates.TangentUp);
  const float3 VertexOffset = CameraOffset + mul(Size * PixelSizeRatio * (UVForPosition - PivotOffset), Tangents);
  Intermediates.VertexWorldPosition = LWCAdd(ParticlePosition, VertexOffset);
  if (NiagaraSpriteVF_AccurateMotionVectors != 0) {
    const FLWCVector3 PrevParticlePosition = GetNiagaraPreviousParticlePosition(ParticleID);
    const float PrevParticleRotation = GetNiagaraPreviousParticleRotation(ParticleID);
    const float2 PrevParticleSize = GetNiagaraPreviousParticleSize(ParticleID);
    const float3 PrevParticleVelocity = GetNiagaraPreviousParticleVelocity(ParticleID);
    const float3 PrevCustomFacing = SafeNormalize(GetNiagaraPreviousParticleFacingVector(ParticleID));
    const float3 PrevCustomAlignment = SafeNormalize(GetNiagaraPreviousParticleAlignmentVector(ParticleID));
    const float2 PrevPivotOffset = GetNiagaraPreviousPivotOffset(ParticleID);
    const float3 PrevCameraOffset = SafeNormalize(LWCToFloat(LWCSubtract(ResolvedView.PrevWorldCameraOrigin, PrevParticlePosition))) * GetNiagaraPreviousCameraOffset(ParticleID);
    const float3 PrevParticleDirection = SafeNormalizeWithFallback(PrevParticleVelocity, float3(0, 0, 1));
    float3 PrevRight, PrevUp;
    GetTangents(Input, PrevParticlePosition, PrevParticleRotation, PrevCustomFacing, PrevCustomAlignment, PrevParticleDirection, PrevRight, PrevUp);
    float2 PrevUVForPosition;
    float2 PrevUVForTexturing;
    float2 PrevUVForTexturingUnflipped;
    ComputeBillboardUVs(Input, PrevParticleSize, SubImageIndex, PrevUVForPosition, PrevUVForTexturing, PrevUVForTexturingUnflipped);
    const float2x3 PrevTangents = float2x3(PrevRight, PrevUp);
    const float3 PrevVertexOffset = PrevCameraOffset + mul(abs(PrevParticleSize) * (PrevUVForPosition - PivotOffset), PrevTangents);
    Intermediates.PreviousVertexWorldPosition = LWCAdd(PrevParticlePosition, PrevVertexOffset);
  } else {
    Intermediates.PreviousVertexWorldPosition = LWCSubtract(Intermediates.VertexWorldPosition, LWCPromote(ParticleVelocity * NiagaraSpriteVF_DeltaSeconds));
  }
  float SubImageLerp = frac(SubImageIndex);
  float SubImageA = SubImageIndex - SubImageLerp + 0.5F;
  float SubImageB = SubImageA + 1;
  float SubImageAH = floor(fmod(SubImageA, NiagaraSpriteVF_SubImageSize.x));
  float SubImageBH = floor(fmod(SubImageB, NiagaraSpriteVF_SubImageSize.x));
  float SubImageAV = floor(SubImageA * NiagaraSpriteVF_SubImageSize.z);
  float SubImageBV = floor(SubImageB * NiagaraSpriteVF_SubImageSize.z);
  Intermediates.TexCoord.xy = (float2(SubImageAH, SubImageAV) + UVForTexturing) * NiagaraSpriteVF_SubImageSize.zw;
  Intermediates.TexCoord.zw = (float2(SubImageBH, SubImageBV) + UVForTexturing) * NiagaraSpriteVF_SubImageSize.zw;
  Intermediates.SubImageLerp = (NiagaraSpriteVF_SubImageBlendMode == 1) ? SubImageLerp : 0.F;
  Intermediates.TangentToLocal = CalcTangentBasis(Intermediates);
  return Intermediates;
}


#line 1001 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float4 VertexFactoryGetWorldPosition(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates) {
  return float4(LWCToFloat(LWCAdd(Intermediates.VertexWorldPosition, ResolvedView.PreViewTranslation)), 1.F);
}


#line 1011 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float4 VertexFactoryGetRasterizedWorldPosition(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates, float4 TranslatedWorldPosition) {
  return TranslatedWorldPosition;
}


#line 1035 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
FVertexFactoryInterpolantsVSToPS VertexFactoryGetInterpolantsVSToPS(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates, FMaterialVertexParameters VertexParameters) {
  FVertexFactoryInterpolantsVSToPS Interpolants;
  Interpolants = (FVertexFactoryInterpolantsVSToPS)0;
  float2 CustomizedUVs[1];
  GetMaterialCustomizedUVs(VertexParameters, CustomizedUVs);
  GetCustomInterpolators(VertexParameters, CustomizedUVs);
  [unroll]
  for (int CoordinateIndex = 0; CoordinateIndex < 1; CoordinateIndex++) {
    SetUV(Interpolants, CoordinateIndex, CustomizedUVs[CoordinateIndex]);
  }
  float3x3 TangentToWorld = Intermediates.TangentToLocal;
  Interpolants.TangentToWorld0AndInterp_Sizer.xyz = TangentToWorld[0];
  Interpolants.TangentToWorld0AndInterp_Sizer.w = Intermediates.SubImageLerp;
  Interpolants.TangentToWorld2 = float4(TangentToWorld[2], sign(determinant(Intermediates.TangentToLocal)));
  Interpolants.Color = Intermediates.Color;
  return Interpolants;
}


#line 1235 "/Plugin/FX/Niagara/Private/NiagaraSpriteVertexFactory.ush"
float3x3 VertexFactoryGetTangentToLocal(FVertexFactoryInput Input, FVertexFactoryIntermediates Intermediates) {
  return Intermediates.TangentToLocal;
}


#line 38 "/Engine/Private/HeightFogCommon.ush"
static const float FLT_EPSILON = 0.00100000005F;
#line 39 "/Engine/Private/HeightFogCommon.ush"
static const float FLT_EPSILON2 = 0.00999999977F;
#line 46 "/Engine/Private/HeightFogCommon.ush"
float3 ComputeInscatteringColor(float3 CameraToReceiver, float CameraToReceiverLength) {
  float3 Inscattering = TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter.xyz;
  [branch]
  if (TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.z > 0) {
    float FadeAlpha = saturate(CameraToReceiverLength * TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.x + TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.y);
    float3 CubemapLookupVector = CameraToReceiver;
    CubemapLookupVector.xy = float2(dot(CubemapLookupVector.xy, float2(TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation.y, -TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation.x)), dot(CubemapLookupVector.xy, TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation.xy));
    float3 DirectionalColor = TextureCubeSampleLevel(TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap, TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler, CubemapLookupVector, 0).xyz;
    float3 NonDirectionalColor = TextureCubeSampleLevel(TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap, TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler, CubemapLookupVector, TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.z).xyz;
    Inscattering *= lerp(NonDirectionalColor, DirectionalColor, FadeAlpha);
  }
  Inscattering += TranslucentBasePass_Shared_Fog_SkyAtmosphereAmbientContributionColorScale.rgb * View_SkyAtmosphereHeightFogContribution.xxx * Texture2DSampleLevel(View_DistantSkyLightLutTexture, View_DistantSkyLightLutTextureSampler, float2(0.5F, 0.5F), 0.F).rgb;
  return Inscattering;
}


#line 73 "/Engine/Private/HeightFogCommon.ush"
float CalculateLineIntegralShared(float FogHeightFalloff, float RayDirectionZ, float RayOriginTerms) {
  float Falloff = max(-127.F, FogHeightFalloff * RayDirectionZ);
  float LineIntegral = (1.F - exp2(-Falloff)) / Falloff;
  float LineIntegralTaylor = log(2.) - (0.5 * Pow2(log(2.))) * Falloff;
  return RayOriginTerms * (abs(Falloff) > FLT_EPSILON2 ? LineIntegral : LineIntegralTaylor);
}


#line 83 "/Engine/Private/HeightFogCommon.ush"
float4 GetExponentialHeightFog(float3 WorldPositionRelativeToCamera, float ExcludeDistance) {
  const float MinFogOpacity = TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter.w;
  const float MaxWorldObserverHeight = TranslucentBasePass_Shared_Fog_ExponentialFogParameters.z;
  const float3 WorldObserverOrigin = float3(LWCToFloat(GetPrimaryView().WorldCameraOrigin).xy, min(LWCToFloat(GetPrimaryView().WorldCameraOrigin).z, MaxWorldObserverHeight));
  float3 CameraToReceiver = WorldPositionRelativeToCamera;
  CameraToReceiver.z += LWCToFloat(GetPrimaryView().WorldCameraOrigin).z - WorldObserverOrigin.z;
  float CameraToReceiverLengthSqr = dot(CameraToReceiver, CameraToReceiver);
  float CameraToReceiverLengthInv = rsqrt(max(CameraToReceiverLengthSqr, 9.99999993E-9F));
  float CameraToReceiverLength = CameraToReceiverLengthSqr * CameraToReceiverLengthInv;
  float3 CameraToReceiverNormalized = CameraToReceiver * CameraToReceiverLengthInv;
  float RayOriginTerms = TranslucentBasePass_Shared_Fog_ExponentialFogParameters.x;
  float RayOriginTermsSecond = TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.x;
  float RayLength = CameraToReceiverLength;
  float RayDirectionZ = CameraToReceiver.z;
  ExcludeDistance = max(ExcludeDistance, TranslucentBasePass_Shared_Fog_ExponentialFogParameters.w);
  if (ExcludeDistance > 0) {
    float ExcludeIntersectionTime = ExcludeDistance * CameraToReceiverLengthInv;
    float CameraToExclusionIntersectionZ = ExcludeIntersectionTime * CameraToReceiver.z;
    float ExclusionIntersectionZ = WorldObserverOrigin.z + CameraToExclusionIntersectionZ;
    float ExclusionIntersectionToReceiverZ = CameraToReceiver.z - CameraToExclusionIntersectionZ;
    RayLength = (1.F - ExcludeIntersectionTime) * CameraToReceiverLength;
    RayDirectionZ = ExclusionIntersectionToReceiverZ;
    float Exponent = max(-127.F, TranslucentBasePass_Shared_Fog_ExponentialFogParameters.y * (ExclusionIntersectionZ - TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.y));
    RayOriginTerms = TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.x * exp2(-Exponent);
    float ExponentSecond = max(-127.F, TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.y * (ExclusionIntersectionZ - TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.w));
    RayOriginTermsSecond = TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.z * exp2(-ExponentSecond);
  }
  float ExponentialHeightLineIntegralShared = CalculateLineIntegralShared(TranslucentBasePass_Shared_Fog_ExponentialFogParameters.y, RayDirectionZ, RayOriginTerms);
  ExponentialHeightLineIntegralShared += CalculateLineIntegralShared(TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.y, RayDirectionZ, RayOriginTermsSecond);
  float ExponentialHeightLineIntegral = ExponentialHeightLineIntegralShared * RayLength;
  float3 InscatteringColor = ComputeInscatteringColor(CameraToReceiver, CameraToReceiverLength);
  float3 DirectionalInscattering = 0;
  [branch]
  if (TranslucentBasePass_Shared_Fog_InscatteringLightDirection.w >= 0 && TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.z == 0) {
    const float UniformPhaseFunction = 1.F / (4.F * PI);
    float3 DirectionalInscatteringColor;
    float3 DirectionalLightInscattering;
    DirectionalInscatteringColor = TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.xyz + View_SkyAtmosphereHeightFogContribution * View_AtmosphereLightIlluminanceOnGroundPostTransmittance[0].rgb * UniformPhaseFunction;
    DirectionalLightInscattering = DirectionalInscatteringColor * pow(saturate(dot(CameraToReceiverNormalized, View_AtmosphereLightDirection[0].xyz)), TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.w);
    if (View_AtmosphereLightIlluminanceOnGroundPostTransmittance[1].a > 0.F) {
      DirectionalInscatteringColor = TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.xyz + View_SkyAtmosphereHeightFogContribution * View_AtmosphereLightIlluminanceOnGroundPostTransmittance[1].rgb * UniformPhaseFunction;
      DirectionalLightInscattering += DirectionalInscatteringColor * pow(saturate(dot(CameraToReceiverNormalized, View_AtmosphereLightDirection[1].xyz)), TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.w);
    }
    float DirectionalInscatteringStartDistance = TranslucentBasePass_Shared_Fog_InscatteringLightDirection.w;
    float DirExponentialHeightLineIntegral = ExponentialHeightLineIntegralShared * max(RayLength - DirectionalInscatteringStartDistance, 0.F);
    float DirectionalInscatteringFogFactor = saturate(exp2(-DirExponentialHeightLineIntegral));
    DirectionalInscattering = DirectionalLightInscattering * (1 - DirectionalInscatteringFogFactor);
  }
  float ExpFogFactor = max(saturate(exp2(-ExponentialHeightLineIntegral)), MinFogOpacity);
  [flatten]
  if (TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.w > 0 && CameraToReceiverLength > TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.w) {
    ExpFogFactor = 1;
    DirectionalInscattering = 0;
  }
  float3 FogColor = (InscatteringColor) * (1 - ExpFogFactor) + DirectionalInscattering;
  return float4(FogColor, ExpFogFactor);
}


#line 211 "/Engine/Private/HeightFogCommon.ush"
float4 CalculateHeightFog(float3 WorldPositionRelativeToCamera) {
  float ExcludeDistance = 0;
  float CosAngle = dot(normalize(WorldPositionRelativeToCamera), View_ViewForward);
  float InvCosAngle = (CosAngle > FLT_EPSILON) ? rcp(CosAngle) : 0;
  ExcludeDistance = View_VolumetricFogMaxDistance * InvCosAngle;
  float4 FogInscatteringAndOpacity = GetExponentialHeightFog(WorldPositionRelativeToCamera, ExcludeDistance);
  return FogInscatteringAndOpacity;
}


#line 23 "/Engine/Private/BasePassVertexCommon.ush"
struct FBasePassVSToPS {
  FVertexFactoryInterpolantsVSToPS FactoryInterpolants;
  FSharedBasePassInterpolants BasePassInterpolants;
  float4 Position : SV_POSITION;
};
#line 20 "/Engine/Private/ParticipatingMediaCommon.ush"
struct FParticipatingMedia {
  float3 ScatteringCoef;
  float3 AbsorptionCoef;
  float3 ExtinctionCoef;
  float3 MeanFreePath;
  float3 Albedo;
  float3 BaseColor;
};
#line 37 "/Engine/Private/SkyAtmosphereCommon.ush"
float2 FromUnitToSubUvs(float2 uv, float4 SizeAndInvSize) {
  return (uv + 0.5F * SizeAndInvSize.zw) * (SizeAndInvSize.xy / (SizeAndInvSize.xy + 1.F));
}


#line 41 "/Engine/Private/SkyAtmosphereCommon.ush"
float4 GetAerialPerspectiveLuminanceTransmittance(bool ViewIsRealTimeReflectionCapture, float4 CameraAerialPerspectiveVolumeSizeAndInvSize, float4 NDC, float3 WorldPositionRelativeToCamera, Texture3D<float4> AerialPerspectiveVolumeTexture, SamplerState AerialPerspectiveVolumeTextureSampler, float AerialPerspectiveVolumeDepthResolutionInv, float AerialPerspectiveVolumeDepthResolution, float AerialPerspectiveVolumeStartDepth, float AerialPerspectiveVolumeDepthSliceLengthKm, float AerialPerspectiveVolumeDepthSliceLengthKmInv, float OneOverExposure, float NearFadeOutRangeInvDepthKm) {
  float2 ScreenUv = (NDC.xy / NDC.ww) * float2(0.5F, -0.5F) + 0.5F;
  float tDepth = max(0.F, length(WorldPositionRelativeToCamera) - AerialPerspectiveVolumeStartDepth);
  float LinearSlice = tDepth * AerialPerspectiveVolumeDepthSliceLengthKmInv;
  float LinearW = LinearSlice * AerialPerspectiveVolumeDepthResolutionInv;
  float NonLinW = sqrt(LinearW);
  float NonLinSlice = NonLinW * AerialPerspectiveVolumeDepthResolution;
  const float HalfSliceDepth = 0.707106769F;
  float Weight = 1.F;
  if (NonLinSlice < HalfSliceDepth) {
    Weight = saturate(NonLinSlice * NonLinSlice * 2.F);
  }
  Weight *= saturate(tDepth * NearFadeOutRangeInvDepthKm);
  if (ViewIsRealTimeReflectionCapture) {
    float3 WorldDir = normalize(WorldPositionRelativeToCamera);
    float SinPhi = WorldDir.z;
    float CosPhi = sqrt(1.F - SinPhi * SinPhi);
    ScreenUv.y = WorldDir.z * 0.5F + 0.5F;
    float CosTheta = WorldDir.x / CosPhi;
    float SinTheta = WorldDir.y / CosPhi;
    float Theta = acos(CosTheta);
    Theta = SinTheta < 0.F ? (PI - Theta) + PI : Theta;
    ScreenUv.x = Theta / (2. * PI);
    ScreenUv = FromUnitToSubUvs(ScreenUv, CameraAerialPerspectiveVolumeSizeAndInvSize);
  }
  float4 AP = Texture3DSampleLevel(AerialPerspectiveVolumeTexture, AerialPerspectiveVolumeTextureSampler, float3(ScreenUv, NonLinW), 0.F);
  AP.rgb *= Weight;
  AP.a = 1. - (Weight * (1.F - AP.a));
  AP.rgb *= OneOverExposure;
  return AP;
}


#line 111 "/Engine/Private/SkyAtmosphereCommon.ush"
float4 GetAerialPerspectiveLuminanceTransmittanceWithFogOver(bool ViewIsRealTimeReflectionCapture, float4 CameraAerialPerspectiveVolumeSizeAndInvSize, float4 NDC, float3 WorldPositionRelativeToCamera, Texture3D<float4> AerialPerspectiveVolumeTexture, SamplerState AerialPerspectiveVolumeTextureSampler, float AerialPerspectiveVolumeDepthResolutionInv, float AerialPerspectiveVolumeDepthResolution, float AerialPerspectiveVolumeStartDepth, float AerialPerspectiveVolumeDepthSliceLengthKm, float AerialPerspectiveVolumeDepthSliceLengthKmInv, float OneOverExposure, float4 FogToApplyOver) {
  const float NearFadeOutRangeInvDepthKm = 1. / 9.99999974E-6F;
  float4 AP = GetAerialPerspectiveLuminanceTransmittance(ViewIsRealTimeReflectionCapture, CameraAerialPerspectiveVolumeSizeAndInvSize, NDC, WorldPositionRelativeToCamera, AerialPerspectiveVolumeTexture, AerialPerspectiveVolumeTextureSampler, AerialPerspectiveVolumeDepthResolutionInv, AerialPerspectiveVolumeDepthResolution, AerialPerspectiveVolumeStartDepth, AerialPerspectiveVolumeDepthSliceLengthKm, AerialPerspectiveVolumeDepthSliceLengthKmInv, OneOverExposure, NearFadeOutRangeInvDepthKm);
  float4 FinalFog;
  FinalFog.rgb = FogToApplyOver.rgb + AP.rgb * FogToApplyOver.a;
  FinalFog.a = FogToApplyOver.a * AP.a;
  return FinalFog;
}


#line 274 "/Engine/Private/SkyAtmosphereCommon.ush"
struct MediumSampleRGB {
  float3 Scattering;
  float3 Absorption;
  float3 Extinction;
  float3 ScatteringMie;
  float3 AbsorptionMie;
  float3 ExtinctionMie;
  float3 ScatteringRay;
  float3 AbsorptionRay;
  float3 ExtinctionRay;
  float3 ScatteringOzo;
  float3 AbsorptionOzo;
  float3 ExtinctionOzo;
  float3 Albedo;
};
#line 28 "/Engine/Private/BasePassVertexShader.usf"
void Main(FVertexFactoryInput Input, out FBasePassVSToPS Output) {
  const uint EyeIndex = 0;
  ResolvedView = (ResolveView());
  FVertexFactoryIntermediates VFIntermediates = GetVertexFactoryIntermediates(Input);
  float4 WorldPositionExcludingWPO = VertexFactoryGetWorldPosition(Input, VFIntermediates);
  float4 WorldPosition = WorldPositionExcludingWPO;
  float4 ClipSpacePosition;
  float3x3 TangentToLocal = VertexFactoryGetTangentToLocal(Input, VFIntermediates);
  FMaterialVertexParameters VertexParameters = GetMaterialVertexParameters(Input, VFIntermediates, WorldPosition.xyz, TangentToLocal);
  {
    WorldPosition.xyz += GetMaterialWorldPositionOffset(VertexParameters);
  }
  {
    float4 RasterizedWorldPosition = VertexFactoryGetRasterizedWorldPosition(Input, VFIntermediates, WorldPosition);
    ClipSpacePosition = mul(RasterizedWorldPosition, ResolvedView.TranslatedWorldToClip);
    Output.Position = (ClipSpacePosition);
  }
  Output.BasePassInterpolants.PixelPositionExcludingWPO = WorldPositionExcludingWPO.xyz;
  Output.FactoryInterpolants = VertexFactoryGetInterpolantsVSToPS(Input, VFIntermediates, VertexParameters);
  Output.BasePassInterpolants.VertexFog = CalculateHeightFog(WorldPosition.xyz - ResolvedView.TranslatedWorldCameraOrigin);
  const float OneOverPreExposure = ResolvedView.OneOverPreExposure;
  if (ResolvedView.SkyAtmosphereApplyCameraAerialPerspectiveVolume > 0.F) {
    Output.BasePassInterpolants.VertexFog = GetAerialPerspectiveLuminanceTransmittanceWithFogOver(ResolvedView.RealTimeReflectionCapture, ResolvedView.SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize, Output.Position, (WorldPosition.xyz - ResolvedView.TranslatedWorldCameraOrigin) * 9.99999974E-6F, View_CameraAerialPerspectiveVolume, View_CameraAerialPerspectiveVolumeSampler, ResolvedView.SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv, ResolvedView.SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution, ResolvedView.SkyAtmosphereAerialPerspectiveStartDepthKm, ResolvedView.SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKm, ResolvedView.SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv, OneOverPreExposure, Output.BasePassInterpolants.VertexFog);
  }
}


 
