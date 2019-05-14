package shopping;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestList {
	@Test
	public void test1() {
		List<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(5);
		list.add(6);
		list.add(7);
		list.add(8);
		System.out.println(list);
		for (int n : list) {
			if(n==5){
				n=6;
			}
			System.out.println(n);
		}
		System.out.println(list);
	}

}
