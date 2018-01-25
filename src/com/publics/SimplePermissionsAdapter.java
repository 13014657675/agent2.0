package com.publics;
import java.util.ArrayList;
import net.sf.navigator.menu.MenuComponent;
import net.sf.navigator.menu.PermissionsAdapter;
public class SimplePermissionsAdapter implements PermissionsAdapter {
	private ArrayList<String> menuNames;
	private boolean flag;
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public SimplePermissionsAdapter(boolean flag, String theMenuNames[]) {
		setFlag(flag);
		menuNames = new ArrayList<String>();
		if (theMenuNames != null) {
			for (int i = 0; i < theMenuNames.length; i++)
				menuNames.add(theMenuNames[i]);

		}
	}
	public boolean isAllowed(MenuComponent menu) {
		if (isFlag())
			return menuNames.contains(menu.getName());
		else
			return !menuNames.contains(menu.getName()); // 超级管理员
	}
}