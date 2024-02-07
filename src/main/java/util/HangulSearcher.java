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
    	return result;
    }
    public static String extractChosung(String s) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch >= '가' && ch <= '힣') {
                int chosungIndex = (ch - '가') / (21 * 28);
                sb.append(CHO_SUNG[chosungIndex]);
            } else {
                sb.append(ch);
            }
        }

        return sb.toString();
    }

}
