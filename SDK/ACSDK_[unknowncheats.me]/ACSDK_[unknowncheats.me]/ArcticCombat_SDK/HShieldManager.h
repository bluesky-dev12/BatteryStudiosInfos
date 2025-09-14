#pragma once

//class DLL_IMPORT UHShieldManager
//{
//private:
//	DWORD					dwUnknown01;	// BOOL bInitialized?
//
//public:
//	UHShieldManager(void);
//	class UHShieldManager& operator=(class UHShieldManager const &);
//	
//	void					RunHShield(void);
//	int						SetupHShield(void);
//	void					ExitHShield(void);
//	
//	int						HS_AhnHSUpdate(struct AHNHS_EXT_ERRORINFOW const &,unsigned short *);
//	int						HS_Init(unsigned short *);
//	void					HS_SetUserID(unsigned short *);
//	int						HS_StartMonitoring(struct AHNHS_EXT_ERRORINFOW &,unsigned short *);
//	int						HS_StartService(void);
//	int						HS_StopService(void);
//	int						HS_UnInit(void);
//	int						HS_UserSetting(unsigned short *);
//	TArray<unsigned char>	MakeUserResponseData(class TArray<unsigned char>);
//};
//
//extern DLL_IMPORT class UHShieldManager *GHSManager;