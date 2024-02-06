package util;

public class HangulSearcher {
	// 초성 리스트
    private static final char[] CHO_SUNG = {
        'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
    };
    
    private static final String[] characters = {
    		"가","까","나","다","따","라","마","바","빠","사","싸","아","자","짜","차","카","타","파","하","힣"
    };
    
    public static String[] search_filter(String keyword) {
    	int num = 0;
    	for(int i = 0; i<CHO_SUNG.length; i++) {
    		
    		if(keyword.equals(String.valueOf(CHO_SUNG[i]))) {
    			num = i;
    			break;
    		}
    	}
    	String[] result = new String[2];
    	result[0] = characters[num];
    	result[1] = characters[num+1];
//    	System.out.println("0:"+result[0] + ",1:"+result[1] );
    	return result;
    }
   
}
