package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.service.RecruitService;
import com.cafe24.nonchrono.dao.MemDAO;
import com.cafe24.nonchrono.dao.RecruitDAO;
import com.cafe24.nonchrono.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    /*
        품목 : 관리자가 입력한 본체, 게임 타이틀, 악세사리 등 품목 (콘솔 게임으로 판매되는 상품이 한정적이라 품목을 미리 정해놓음)
        상품 : 판매자가 등록한 판매 상품. 품목을 등록하면 정보를 가져와서 쓴다
    */

    @Autowired
    private RecruitDAO recruitDAO;

    @Autowired
    private MemDAO memDAO;

    @Autowired
    private RecruitService recruitService;

    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    // 모집 게시판 홈
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView recruitList(HttpSession session, String order) {
        RecruitDTO dto = new RecruitDTO();
        ModelAndView mav = new ModelAndView();
        // 정렬에 사용할 변수. 기본값을 최신순으로 설정해준다
        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }

        // 종료일이 끝나지 않은 진행 중인 모집글의 정보(댓글 수, 참여 수 포함)를 9개까지 가져온다
        List<RecruitDTO> list = recruitDAO.list(order);

        // 현재 세션에 저장된 아이디를 가져와서 변수에 담는다
        String mem_id = (String) session.getAttribute("mem_id");
        // 현재 세션에 저장된 아이디가 있다면
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("list", list); // 모집글 정보
            mav.addObject("rcrKing", recruitDAO.rcrKing()); // 모집글 작성자 중 가장 많은 모집글을 작성한 사람
            mav.addObject("searchRank", recruitDAO.searchRank()); // 검색 랭킹
            mav.setViewName("/recruit/recruit"); // 모집 게시판 홈으로 이동
        } else {
            // 로그인 화면으로 이동
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitList() end

    // ajax로 정렬 기준 바꿀 때
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    // 정렬 기준과 검색어를 받아온다
    public List<MoreDTO> recruitListAjax(HttpSession session, String order, String keyword) {
        // 재정렬로 가져올 모집글 정보를 담을 리스트 선언
        List<MoreDTO> list;

        // 정렬에 사용할 변수. 기본값을 최신순으로 설정해준다
        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }

        // 키워드가 없을 때 정렬 기준에 따라 모집글을 가져온다
        if (keyword.equals("null") || keyword.equals("")) {
            list = recruitDAO.listAjax(order);
        } else {
            // 키워드가 있을 때 검색어와 정렬 기준에 따라 모집글을 가져온다
            list = recruitDAO.listAjax2(order, keyword);
        }

        return list;
    } // recruitList() end

    // 모집 게시판 글 작성
    @RequestMapping("/form")
    public ModelAndView recruitForm(HttpServletRequest req) throws Exception {
        ModelAndView mav = new ModelAndView();
        HttpSession session = req.getSession();
        // 현재 세션에 저장된 아이디를 가져와서 변수에 담는다
        String mem_id = (String) session.getAttribute("mem_id");
        // 현재 세션에 저장된 회원 아이디가 있다면
        if (mem_id != null && !mem_id.equals("guest")) {
            // 아이디에 맞는 닉네임을 가져온다
            mav.addObject("nickname", recruitDAO.nickname(mem_id));
            // 모집 게시판 글 작성 화면으로 이동
            mav.setViewName("/recruit/recruitForm");
        } else {
            // 로그인 화면으로 이동
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitForm() end

    // 모집 게시판 검색 과정
    /*@RequestMapping( "/searchProc")
    @ResponseBody
    public String search(HttpServletRequest req) {
        // 검색어를 가져온다
        String keyword = req.getParameter("gs_keyword").trim();
        // 응답 메세지에 담을 변수 선언
        String message = "";

        // 검색어가 존재할 때
        if (keyword.trim().length() > 0) {
            // 검색어가 포함된 품목의 코드와 품목명을 가져온다 (원래는 품목 중에 게임 타이틀로만 제한해둬야하지만 굳이 하지 않았다)
            ArrayList<String> list = searchList(keyword);
            ArrayList<String> list2 = new ArrayList<String>();

            RecruitDTO dto = new RecruitDTO();

            int size = list.size();
            // 품목이 존재할 때
            if (size > 0) {
                // 타이틀 제목을 message에 담기
                // 총 사이즈를 담고 구분자 ^^^로 구분 (|로 구분했다가 품목명에 |이 들어간 게임은 구분이 되지 않았다)
                message += size + "^^^";
                for (int i = 0; i < size; i++) {
                    // 품목명를 변수로 선언
                    String title = list.get(i);
                    // message 변수에 품목명을 담는다
                    message += title;
                    // 품목명에 맞는 품목 코드를 리스트2에 담는다
                    list2.add(recruitDAO.gm_list2(title));
                    // 마지막 품목명이 아닐 때
                    if (i < size - 1) {
                        // 품목명을 ,로 구분한다
                        message += ",";
                    } // if end
                } // for end

                // 품목명을 담은 후 다시 구분자 ^^^로 구분
                message += "^^^";

                // 타이틀 코드를 message에 담기
                for (int j = 0; j < size; j++) {
                    // 품목 코드를 변수로 선언
                    String code = list2.get(j);
                    // message 변수에 품목 코드를 담는다
                    message += code;
                    // 마지막 품목 코드가 아닐 때
                    if (j < size - 1) {
                        // 품목 코드를 ,로 구분한다
                        message += ",";
                    } // if end
                } // for end

            } // if end
        } // if end

        return message;
    } // searchProc() end*/

    // 모집 게시판 검색 리스트
    /*public ArrayList<String> searchList(String keyword) {
        // 품목 목록을 담기 위해 리스트2를 선언
        ArrayList<String> list2 = new ArrayList<String>();
        // 품목명과 품목 코드를 가져와서 그 사이즈만큼 반복
        for (int i = 0; i < recruitDAO.gm_list().size(); i++) {
            // 품목명을 list2에 추가
            list2.add(recruitDAO.gm_list().get(i).getGm_name());
        } // for end

        // list2의 내용을 keywords 배열에 담는다
        String[] keywords = list2.toArray(new String[0]);

        // 검색어에 맞는 품목명을 담기 위한 리스트를 선언
        ArrayList<String> list = new ArrayList<String>();
        // keywords 배열에 담긴 값을 word 변수에 하나씩 배당하며 반복한다
        for (String word : keywords) {
            // 영문자의 경우 대소문자를 구분하지 않기 위해 모두 대문자로 바꾼다
            word = word.toUpperCase();
            // word 변수에 keyword가 포함되어있을 때
            if (word.contains(keyword.toUpperCase())) {
                // list에 word를 추가한다
                list.add(word);
            } // if end
        } // for end
        return list;
    } // searchList() end*/

    // CKEditor 이미지 업로드
    @RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = ResourceUtils.getURL("classpath:static/images").getPath(); // 이미지 경로 설정(폴더 자동 생성)
            path = path + "/recruit/";

            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            // 폴더가 존재하지 않는다면
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/recruit/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    } // imageUpload() end

    // CKEditor 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value = "/ckImgSubmit")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        ServletContext application = req.getSession().getServletContext();
        String path = ResourceUtils.getURL("classpath:static/images").getPath(); // 이미지 경로 설정(폴더 자동 생성)
        path = path + "/recruit/";
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = resp.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    } // ckSubmit() end

    // 모집 정보 상세보기
    @RequestMapping("/detail/{rcrbrd_num}")
    public ModelAndView recruitDetail(@PathVariable int rcrbrd_num, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        // 세션에 담긴 아이디 가져오기
        String mem_id = (String) session.getAttribute("mem_id");

        // 로그인 상태라면
        if (mem_id != null && !mem_id.equals("guest")) {
            Map<String, Object> detail = recruitDAO.detail(rcrbrd_num);
            RecruitDTO recruitDTO = (RecruitDTO) detail.get("rcrBoard"); // 모집 정보
            GameDTO gameDTO = (GameDTO) detail.get("game"); // 게임 정보
            MemDTO memDTO = (MemDTO) detail.get("member"); // 모집장 정보
            int cnt = Integer.parseInt((String.valueOf(detail.get("cnt")))); // 모집장의 모집 횟수

            /* 모집장 & 게시글 정보 관련 */
            mav.addObject("mem_id", mem_id); // 세션에 담긴 아이디 전달
            mav.addObject("views", recruitDAO.views(rcrbrd_num)); // 조회수 증가
            mav.addObject("detail", recruitDTO); // 모집 정보 상세보기
            mav.addObject("gameDetail", gameDTO); // 게임 정보 상세보기
            mav.addObject("memDetail", memDTO); // 모집장 정보 상세보기
            mav.addObject("recruitCount", cnt); // 모집장의 모집 횟수 카운트
            mav.addObject("memTemp", memDAO.temp(memDTO.getMem_id())); // 모집장의 온도 가져오기

            /* 역할 & 좌석 관련 */
            mav.addObject("roleList", recruitDAO.roleList(rcrbrd_num)); // 역할 테이블에서 역할 리스트 가져오기 (모집장)
            mav.addObject("attendCheck", recruitDAO.attendCheck(rcrbrd_num, mem_id)); // 본인이 어느 자리에 참가했는지 확인
            mav.addObject("roleNameSeat", recruitDAO.roleName(rcrbrd_num)); // 역할 배정 테이블에서 역할 이름과 좌석 번호 가져오기 (참가자)
            mav.addObject("seatDetail", recruitService.seatDetail(rcrbrd_num, recruitDTO.getRcrbrd_max())); // 좌석 번호에 맞는 아이디, 프로필, 닉네임 가져오기

            /* 댓글 관련 */
            mav.addObject("commentList", recruitDAO.commentList(rcrbrd_num)); // 댓글 목록 불러오기

            // 모집 상세 페이지로 이동
            mav.setViewName("/recruit/recruitDetail");
        } else {
            // 로그인 폼으로 이동
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    } // recruitDetail() end

    // 모집 정보 작성
    @RequestMapping("/insert")
    public String recruitInsert(@ModelAttribute RecruitDTO recruitDTO, @ModelAttribute RoleDTO roleDTO, @RequestParam int useMileage, HttpServletRequest req, HttpSession session) {

        // 로그인 아이디 가져오기
        String mem_id = (String) session.getAttribute("mem_id");

        // 가용 마일리지 가져오기
        int mileage = recruitDAO.mileageCheck(mem_id);
        // 마일리지 사용 (사용하려는 마일리지가 가용 마일리지보다 작을 때)
        if (mileage >= useMileage) {
            recruitDAO.useMileage(mem_id, useMileage);
        } else {
            // 마일리지가 부족하다면 작성폼으로 다시 이동
            return "redirect:/recruit/form";
        }

        // 모집 내용 insert (hiddenCount = 역할 추가 수)
        recruitDAO.insert(recruitDTO, Integer.parseInt(req.getParameter("hiddenCount")));
        // 위에서 insert한 게시글 번호 가져오기
        int num = recruitDAO.numSearch();

        // 역할 추가 수만큼 반복하여 역할 내용 insert
        for (int i = 1; i <= Integer.parseInt(req.getParameter("hiddenCount")); i++) {

            roleDTO.setRl_name(req.getParameter("rl_role" + i));
            roleDTO.setRcrbrd_num(num);

            recruitDAO.roleInsert(roleDTO);
        }

        return "redirect:/recruit/detail/" + num;
    } // recruitWrite() end

    // 모집 좌석 예약
    @RequestMapping("/attend")
    public String attend(@ModelAttribute RecruitInfoDTO recruitInfoDTO) {
        recruitDAO.attend(recruitInfoDTO);
        return "redirect:/recruit";
    } // attend() end

    @RequestMapping("/roleConfirm")
    @ResponseBody
    public void roleConfirm(@ModelAttribute RoleSeatDTO roleSeatDTO, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        int cnt = recruitDAO.roleConfirm(roleSeatDTO);
        if (cnt == 0) {
            out.println("<script>alert('해당 역할은 모집이 마감되었습니다.'); history.go(-1);</script>");
            out.flush();
        }
    } // roleConfirm() end

    // 게시판 번호와 좌석 번호로 데이터가 존재하는지 확인
    @RequestMapping("/roleSeatCheck")
    @ResponseBody
    public int roleSeatCheck(@ModelAttribute RoleSeatDTO roleSeatDTO) {
        return recruitDAO.roleSeatCheck(roleSeatDTO);
    } // roleSeatCheck() end

    @RequestMapping("/getMoreContents")
    @ResponseBody
    public List<MoreDTO> getMoreContents(int startCount, int endCount, String order, String keyword) {
        return recruitDAO.getMoreContents(startCount, endCount, order, keyword);
    } // getMoreContents() end

    @RequestMapping("/delete")
    public String delete(@RequestParam int rcrbrd_num, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            int cnt = recruitDAO.delete(rcrbrd_num);
            if (cnt == 0) {
                System.out.println("삭제에 실패하였습니다!");
            }
            return "redirect:/recruit";
        } else {
            return "/mem/loginForm";
        }
    } // delete() end

    // 진행중 -> 진행완료 변경
    @RequestMapping("/status")
    public String status(int rcrbrd_num) {
        int cnt = recruitDAO.status(rcrbrd_num);
        return "redirect:/recruit/detail/" + rcrbrd_num;
    }

    @RequestMapping("/myDelete")
    @ResponseBody
    public String myDelete(HttpSession session, HttpServletRequest request) {
        String mem_id = (String) session.getAttribute("mem_id");
        int rcrbrd_num = Integer.parseInt(request.getParameter("rcrbrd_num"));
        int cnt = recruitDAO.delete(rcrbrd_num);
        String result = "";
        List<Map<String,Object>> list = new ArrayList<>();
        if (cnt == 0) {
            System.out.println("삭제에 실패하였습니다!");
        } else {
            list = recruitDAO.rcrbrdlist(mem_id);
            if (list.size()==0) {
                result += "<tr><td colspan=\"5\"><h5>없음</h5></td></tr>";
            } else {
                for (int i=0; i< list.size(); i++) {
                    result += "<tr>";
                    result += "    <td class=\"shoping__cart__item\">";
                    result += "        <img class=\"gm_img\" src=\"/images/thumb/" + list.get(i).get("gm_code") + "/thumb.jpg\">";
                    result += "        <h5 style=\"font-weight: 700\">" + list.get(i).get("rcrbrd_subject") + "</h5>";
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__price gm_name\">";
                    result += "        "+list.get(i).get("gm_name");
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__quantity people_cnt\">";
                    result += "        <h5 style=\"font-weight: 700\">" + list.get(i).get("cnt") + "</h5>";
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__total\">";
                    result += "        " + list.get(i).get("rcrbrd_edate");
                    result += "    </td>";
                    result += "    <td class=\"shoping__cart__item__close\" id=\"close\">";
                    result += "        <span class=\"icon_close\" onclick=\"rcrDelete(" + list.get(i).get("rcrbrd_num") + ")\"></span>";
                    result += "    </td>";
                    result += "</tr>";
                }
            }

        }
        return result;
    }

    @RequestMapping("/heart")
    @ResponseBody
    public String heart(@ModelAttribute RatingDTO ratingDTO) {
        return recruitDAO.heart(ratingDTO);
    }

    @RequestMapping("/declare")
    @ResponseBody
    public String declare(@ModelAttribute RatingDTO ratingDTO) {
        return recruitDAO.declare(ratingDTO);
    }

    @RequestMapping("/comment")
    @ResponseBody
    public int comment(@ModelAttribute CommentDTO commentDTO, HttpSession session) {
        String mem_id = (String) session.getAttribute("mem_id");
        commentDTO.setMem_id(mem_id);
        // System.out.println(commentDTO);
        int cnt = recruitDAO.comment(commentDTO);
        return cnt;
    }

    @RequestMapping("/commentList")
    @ResponseBody
    public List<Map<String, Object>> commentList(int rcrbrd_num) {
        List<Map<String, Object>> list = recruitDAO.commentList(rcrbrd_num);
        return list;
    }

    @RequestMapping("/searchWord")
    public ModelAndView searchWord(HttpSession session, String order, @RequestParam String gs_keyword) {
        RecruitDTO dto = new RecruitDTO();
        ModelAndView mav = new ModelAndView();
        String order2 = "rcrbrd_num";
        if (order == null || order.equals("")) {
            order = order2;
        }

        List<RecruitDTO> list = recruitDAO.list2(order, gs_keyword);

        String mem_id = (String) session.getAttribute("mem_id");
        if (mem_id != null && !mem_id.equals("guest")) {
            mav.addObject("list", list);
            mav.addObject("rcrKing", recruitDAO.rcrKing());
            mav.addObject("searchRank", recruitDAO.searchRank());
            // System.out.println(recruitDAO.rcrKing());
            mav.setViewName("/recruit/recruit");
        } else {
            mav.setViewName("/mem/loginForm");
        }
        return mav;
    }

    // 모집 완료 후 보너스 100 포인트
    @RequestMapping("/bonus")
    @ResponseBody
    public int bonus(String mem_id) {
        return recruitDAO.useMileage(mem_id, -100);
    }

    @RequestMapping("/commentDelete/{com_num}")
    @ResponseBody
    public int commentDelete(@PathVariable int com_num) throws Exception {
        return recruitDAO.commentDelete(com_num);
    }

    @RequestMapping("/commentUpdate")
    @ResponseBody
    public int commentUpdate(@RequestParam String com_content,@RequestParam int com_num) throws Exception {
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setCom_content(com_content);
        commentDTO.setCom_num(com_num);
         return recruitDAO.commentUpdate(commentDTO);
    }

    @RequestMapping("/open/{rcrbrd_num}")
    public String open(@PathVariable int rcrbrd_num) throws Exception {
        int cnt = recruitDAO.open(rcrbrd_num);
        return "redirect:/recruit";
    }

    @RequestMapping("/gameList")
    @ResponseBody
    public List<GameDTO> gameList() {
        return recruitDAO.gm_list();
    }

    // 삭제 후 이메일 발송

} // class end
